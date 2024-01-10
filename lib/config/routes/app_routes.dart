
import 'package:sahayatri/features/auth/presentation/view/signup_view.dart';
import 'package:sahayatri/features/auth/presentation/view/splashscreen_view.dart';

class AppRoute {
  AppRoute._();
  static const String splashscreenRoute = '/SplashScreen';
  static const String signUpRoute = '/SignUpScreen';
  
  static getApplication() {
    return {
      splashscreenRoute: (context) => const SplashScreenView(),
      signUpRoute: (context) => const SignUpView(),
      
    
    };
  }
}
