import 'package:flutter/material.dart';
import '../views/home_screen.dart';
import '../views/splash_screen.dart';
import '../views/language_selection_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String language = '/language';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      language: (context) => const LanguageSelectionScreen(),
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
