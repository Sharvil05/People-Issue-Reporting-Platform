import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/app_controller.dart';
import 'controllers/language_controller.dart';
import 'controllers/auth_controller.dart';
import 'routes/app_routes.dart';
import 'utils/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppController()),
        ChangeNotifierProvider(create: (_) => LanguageController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: const PeopleIssueReportingApp(),
    ),
  );
}

class PeopleIssueReportingApp extends StatelessWidget {
  const PeopleIssueReportingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'People Issue Reporting Platform',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
