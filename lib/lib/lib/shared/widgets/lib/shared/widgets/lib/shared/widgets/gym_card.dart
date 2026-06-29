import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class GymCard extends StatelessWidget {
  final Widget child;

  const GymCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
