import 'package:flutter/material.dart';
import 'package:random_qoutes/config/app%20routes/app_routes.dart';
import 'package:random_qoutes/core/utils/app_strings.dart';
import 'package:random_qoutes/config/theme/app_theme.dart';

class QouteApp extends StatelessWidget {
  const QouteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute ,
      
    );
  }
}
