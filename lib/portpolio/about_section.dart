import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
            'About Me',
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
            'A little more about me and my development journey.',
            style: TextStyle(
              color: AppTheme.grey,
              fontSize: 16,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 35),

          isMobile
              ? const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AboutText(),
              SizedBox(height: 30),
              _AboutInfo(),
            ],
          )
              : const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: _AboutText(),
              ),
              SizedBox(width: 60),
              Expanded(
                child: _AboutInfo(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AboutText extends StatelessWidget {
  const _AboutText();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Who I Am',
          style: TextStyle(
            color: AppTheme.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 15),

        Text(
          'I am a Computer Science student and Flutter Developer '
              'who enjoys building modern, responsive and user-friendly '
              'mobile applications.',
          style: TextStyle(
            color: AppTheme.grey,
            fontSize: 16,
            height: 1.8,
          ),
        ),

        SizedBox(height: 15),

        Text(
          'I am continuously improving my programming skills and '
              'learning new technologies. My goal is to become a '
              'professional Flutter Developer and build high-quality '
              'software applications.',
          style: TextStyle(
            color: AppTheme.grey,
            fontSize: 16,
            height: 1.8,
          ),
        ),
      ],
    );
  }
}

class _AboutInfo extends StatelessWidget {
  const _AboutInfo();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppTheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoItem(
            icon: Icons.school_outlined,
            title: 'Education',
            value: 'BS Computer Science',
          ),

          SizedBox(height: 20),

          _InfoItem(
            icon: Icons.code,
            title: 'Role',
            value: 'Flutter Developer',
          ),

          SizedBox(height: 20),

          _InfoItem(
            icon: Icons.phone_android_outlined,
            title: 'Focus',
            value: 'Mobile App Development',
          ),

          SizedBox(height: 20),

          _InfoItem(
            icon: Icons.devices_outlined,
            title: 'UI',
            value: 'Responsive Design',
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: AppTheme.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: AppTheme.secondary,
            size: 22,
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppTheme.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                value,
                style: const TextStyle(
                  color: AppTheme.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}