import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/app_theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const List<Map<String, String>> projects = [
    {
      'title': 'Student Management App',
      'description':
      'A Flutter application for managing students, courses and attendance.',
      'technology': 'Flutter • Dart • SQLite',
      'image': 'assets/images/student_management.jpg',
      'github': '',
      'demo': '',
    },
    {
      'title': 'Weather App',
      'description':
      'A weather application that displays weather information using an API.',
      'technology': 'Flutter • Dart • REST API',
      'image': 'assets/images/weather_app.jpg',
      'github': '',
      'demo': '',
    },
    {
      'title': 'WhatsApp UI',
      'description':
      'A responsive chat application interface inspired by modern messaging apps.',
      'technology': 'Flutter • Dart • Material Design',
      'image': 'assets/images/whatsapp_app.jpg',
      'github': '',
      'demo': '',
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
            'My Projects',
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
            'Some of the applications and interfaces I have built with Flutter.',
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

              final crossAxisCount = availableWidth < 600
                  ? 1
                  : availableWidth < 1000
                  ? 2
                  : 3;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: isMobile
                      ? 0.82
                      : isTablet
                      ? 0.78
                      : 0.82,
                ),
                itemBuilder: (context, index) {
                  final project = projects[index];

                  return _ProjectCard(
                    title: project['title']!,
                    description: project['description']!,
                    technology: project['technology']!,
                    image: project['image']!,
                    github: project['github']!,
                    demo: project['demo']!,
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

class _ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String technology;
  final String image;
  final String github;
  final String demo;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.technology,
    required this.image,
    required this.github,
    required this.demo,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  Future<void> _openUrl(String url) async {
    if (url.isEmpty) {
      return;
    }

    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(
          0,
          _isHovered ? -6 : 0,
          0,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _isHovered
                ? AppTheme.secondary
                : AppTheme.primary.withValues(alpha: 0.3),
            width: _isHovered ? 1.5 : 1,
          ),
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: AppTheme.primary.withValues(alpha: 0.20),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: AppTheme.background,
                child: Image.asset(
                  widget.image,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: AppTheme.grey,
                        size: 45,
                      ),
                    );
                  },
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppTheme.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Expanded(
                      child: Text(
                        widget.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppTheme.grey,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      widget.technology,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppTheme.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: widget.github.isEmpty
                                ? null
                                : () {
                              _openUrl(widget.github);
                            },
                            icon: const Icon(
                              Icons.code,
                              size: 18,
                            ),
                            label: const Text('GitHub'),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: widget.demo.isEmpty
                                ? null
                                : () {
                              _openUrl(widget.demo);
                            },
                            icon: const Icon(
                              Icons.open_in_new,
                              size: 18,
                            ),
                            label: const Text('Demo'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}