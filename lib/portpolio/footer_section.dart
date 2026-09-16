import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      decoration: const BoxDecoration(
        color: AppTheme.surface,
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 3,
            decoration: BoxDecoration(
              color: AppTheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Iqbal Nawaz',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.primary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Flutter Developer',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.grey,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Building modern and responsive mobile applications with Flutter.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.grey,
              fontSize: 13,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 25),

          const Divider(
            color: AppTheme.grey,
            height: 1,
          ),

          const SizedBox(height: 20),

          const Text(
            '© 2026 Iqbal Nawaz. All rights reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}