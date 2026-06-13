import 'package:flutter/material.dart';
import '../views/home_screen.dart';
import '../views/splash_screen.dart';
import '../views/language_selection_screen.dart';
import '../views/auth/login_screen.dart';
import '../views/auth/signup_screen.dart';
import '../views/auth/forgot_password_screen.dart';
import '../views/citizen/citizen_dashboard.dart';
import '../views/admin/admin_dashboard.dart';

class AppRoutes {
  static const String splash = '/';
  static const String language = '/language';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String citizenDashboard = '/citizen-home';
  static const String adminDashboard = '/admin-home';
  static const String home = '/home'; // Legacy home

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      language: (context) => const LanguageSelectionScreen(),
      login: (context) => const LoginScreen(),
      signup: (context) => const SignupScreen(),
      forgotPassword: (context) => const ForgotPasswordScreen(),
      citizenDashboard: (context) => const CitizenDashboard(),
      adminDashboard: (context) => const AdminDashboard(),
      home: (context) => const HomeScreen(),
    };
  }

  // Helper method for navigation setup for future screens
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case language:
        return MaterialPageRoute(builder: (_) => const LanguageSelectionScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case citizenDashboard:
        return MaterialPageRoute(builder: (_) => const CitizenDashboard());
      case adminDashboard:
        return MaterialPageRoute(builder: (_) => const AdminDashboard());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
