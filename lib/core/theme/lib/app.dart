import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';

class GymFlowApp extends StatelessWidget {
  const GymFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'GymFlow Pro',

      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
        useMaterial3: true,

        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          background: AppColors.background,
          surface: AppColors.surface,
          error: AppColors.error,
        ),
      ),

      home: const SplashScreen(),
    );
  }
}
