import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahayatri/config/constants/api_endpoints.dart';
import 'package:sahayatri/core/failure/failure.dart';
import 'package:sahayatri/core/networking/http_service.dart';
import 'package:sahayatri/features/auth/data/model/user_api_model.dart';
import 'package:sahayatri/features/auth/domain/entity/user_entity.dart';


final userRemoteDataSourceProvider = 
Provider.autoDispose<UserRemoteDataSource>(
  (ref)=> UserRemoteDataSource(
    dio: ref.read(httpServiceProvider))
);

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource({required this.dio});

  Future<Either<Failure, bool>> regsiterUser(UserEntity user) async {
    try {
      UserAPiModel userAPiModel = UserAPiModel.fromEntity(user);
      var response = await dio.post(
            ApiEndpoints.register, 
            data: userAPiModel.toJson());
      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString()
        
        )
        );
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.response?.data['message']));
    }
  }
}
