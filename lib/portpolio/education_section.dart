import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1000;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? 20
            : isTablet
            ? 40
            : 80,
        vertical: isMobile ? 60 : 90,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Education',
            style: TextStyle(
              color: AppTheme.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Container(
            width: 70,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'My academic background and current learning journey.',
            style: TextStyle(
              color: AppTheme.grey,
              fontSize: 16,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 35),

          const _EducationCard(),
        ],
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  const _EducationCard();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isMobile ? 20 : 30,
      ),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.primary.withValues(alpha: 0.35),
        ),
      ),
      child: isMobile
          ? const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _EducationIcon(),
          SizedBox(height: 20),
          _EducationDetails(),
        ],
      )
          : const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _EducationIcon(),
          SizedBox(width: 25),
          Expanded(
            child: _EducationDetails(),
          ),
        ],
      ),
    );
  }
}

class _EducationIcon extends StatelessWidget {
  const _EducationIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.secondary.withValues(alpha: 0.25),
        ),
      ),
      child: const Icon(
        Icons.school_outlined,
        color: AppTheme.secondary,
        size: 38,
      ),
    );
  }
}

class _EducationDetails extends StatelessWidget {
  const _EducationDetails();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'BS Computer Science',
          style: TextStyle(
            color: AppTheme.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Bachelor of Science in Computer Science',
          style: TextStyle(
            color: AppTheme.primary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 18),

        const Text(
          'Currently studying Computer Science and continuously '
              'developing my skills in software development, Flutter, '
              'Dart, mobile application development and modern technologies.',
          style: TextStyle(
            color: AppTheme.grey,
            fontSize: 15,
            height: 1.7,
          ),
        ),

        const SizedBox(height: 22),

        if (isMobile)
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _FocusItem(
                icon: Icons.phone_android_outlined,
                text: 'Flutter & Mobile App Development',
              ),
              SizedBox(height: 12),
              _FocusItem(
                icon: Icons.code,
                text: 'Software Development',
              ),
              SizedBox(height: 12),
              _FocusItem(
                icon: Icons.devices_outlined,
                text: 'Responsive UI Development',
              ),
            ],
          )
        else
          const Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _FocusItem(
                icon: Icons.phone_android_outlined,
                text: 'Flutter & Mobile App Development',
              ),
              _FocusItem(
                icon: Icons.code,
                text: 'Software Development',
              ),
              _FocusItem(
                icon: Icons.devices_outlined,
                text: 'Responsive UI Development',
              ),
            ],
          ),
      ],
    );
  }
}

class _FocusItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FocusItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppTheme.secondary,
            size: 19,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                color: AppTheme.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}