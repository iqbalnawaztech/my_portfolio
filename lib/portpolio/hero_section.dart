import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/app_theme.dart';
import 'portfolio_app_bar.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 700;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: isMobile
          ? const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _HeroImage(),
          SizedBox(height: 40),
          _HeroText(),
        ],
      )
          : const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: _HeroText(),
          ),
          SizedBox(width: 60),
          Expanded(
            flex: 2,
            child: _HeroImage(),
          ),
        ],
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText();

  Future<void> _openGitHub() async {
    final uri = Uri.parse(
      'https://github.com/iqbalnawaztech',
    );

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 700;

    return Column(
      crossAxisAlignment:
      isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const Text(
          'Hello, I am',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.secondary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          'Iqbal Nawaz',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            color: AppTheme.white,
            fontSize: isMobile ? 40 : 52,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          'Flutter Developer',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            color: AppTheme.secondary,
            fontSize: isMobile ? 25 : 30,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          'I build modern, responsive and user-friendly '
              'mobile applications using Flutter and Dart.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            color: AppTheme.grey,
            fontSize: 17,
            height: 1.7,
          ),
        ),

        const SizedBox(height: 30),

        Wrap(
          alignment: isMobile
              ? WrapAlignment.center
              : WrapAlignment.start,
          spacing: 15,
          runSpacing: 12,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF22D3EE)),
              onPressed: () {
                PortfolioNavigation.goTo(
                  PortfolioNavigation.projectsKey,
                );
              },
              child: const Text('View Projects'),
            ),

            OutlinedButton(
              onPressed: () {
                PortfolioNavigation.goTo(
                  PortfolioNavigation.contactKey,
                );
              },
              child: const Text('Contact Me'),
            ),

            OutlinedButton.icon(
              onPressed: _openGitHub,
              icon: const Icon(
                Icons.code,
                size: 18,
              ),
              label: const Text('GitHub'),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroImage extends StatelessWidget {
  const _HeroImage();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final imageSize = width < 700 ? 230.0 : 280.0;

    return Center(
      child: Container(
        width: imageSize,
        height: imageSize,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppTheme.secondary,
            width: 3,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/my_profile.png',
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}