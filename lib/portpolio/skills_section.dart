import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const List<Map<String, dynamic>> skills = [
    {
      'name': 'Flutter',
      'icon': Icons.phone_android,
      'level': 0.90,
      'percentage': '90%',
    },
    {
      'name': 'Dart',
      'icon': Icons.code,
      'level': 0.90,
      'percentage': '90%',
    },
    {
      'name': 'Firebase',
      'icon': Icons.local_fire_department,
      'level': 0.70,
      'percentage': '70%',
    },
    {
      'name': 'REST API',
      'icon': Icons.api,
      'level': 0.70,
      'percentage': '70%',
    },
    {
      'name': 'Git',
      'icon': Icons.source,
      'level': 0.75,
      'percentage': '75%',
    },
    {
      'name': 'GitHub',
      'icon': Icons.code,
      'level': 0.80,
      'percentage': '80%',
    },
    {
      'name': 'Provider',
      'icon': Icons.settings,
      'level': 0.65,
      'percentage': '65%',
    },
    {
      'name': 'SQLite',
      'icon': Icons.storage,
      'level': 0.65,
      'percentage': '65%',
    },
    {
      'name': 'Responsive UI',
      'icon': Icons.devices,
      'level': 0.85,
      'percentage': '85%',
    },
    {
      'name': 'Material Design',
      'icon': Icons.design_services,
      'level': 0.80,
      'percentage': '80%',
    },
  ];

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
            'My Skills',
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
            'Technologies and tools I use to build modern applications.',
            style: TextStyle(
              color: AppTheme.grey,
              fontSize: 16,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 35),

          LayoutBuilder(
            builder: (context, constraints) {
              final availableWidth = constraints.maxWidth;

              final crossAxisCount = availableWidth < 500
                  ? 1
                  : availableWidth < 900
                  ? 2
                  : 3;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skills.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: isMobile
                      ? 2.0
                      : isTablet
                      ? 1.7
                      : 1.8,
                ),
                itemBuilder: (context, index) {
                  final skill = skills[index];

                  return _SkillCard(
                    name: skill['name'] as String,
                    icon: skill['icon'] as IconData,
                    level: skill['level'] as double,
                    percentage: skill['percentage'] as String,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final double level;
  final String percentage;

  const _SkillCard({
    required this.name,
    required this.icon,
    required this.level,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: AppTheme.secondary,
                  size: 23,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppTheme.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Text(
                percentage,
                style: const TextStyle(
                  color: AppTheme.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: level,
              minHeight: 7,
              backgroundColor: AppTheme.background,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppTheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}