import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/app_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
            'Contact Me',
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
            'Have a project or opportunity? Feel free to get in touch.',
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
              _ContactInfo(),
              SizedBox(height: 30),
              _ContactCard(),
            ],
          )
              : const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _ContactInfo(),
              ),
              SizedBox(width: 50),
              Expanded(
                child: _ContactCard(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo();

  Future<void> _openEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'iqbalnawaztech@gmail.com',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _openGitHub() async {
    final uri = Uri.parse(
      'https://github.com/iqbalnawaztech',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Let’s work together',
          style: TextStyle(
            color: AppTheme.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        const Text(
          'I am always interested in learning, building new projects '
              'and exploring opportunities. Feel free to contact me.',
          style: TextStyle(
            color: AppTheme.grey,
            fontSize: 16,
            height: 1.7,
          ),
        ),

        const SizedBox(height: 30),

        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: _openEmail,
          child: const _ContactItem(
            icon: Icons.email_outlined,
            title: 'Email',
            value: 'iqbalnawaztech@gmail.com',
          ),
        ),

        const SizedBox(height: 20),

        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: _openGitHub,
          child: const _ContactItem(
            icon: Icons.code,
            title: 'GitHub',
            value: 'github.com/iqbalnawaztech',
          ),
        ),

        const SizedBox(height: 20),

        const _ContactItem(
          icon: Icons.location_on_outlined,
          title: 'Location',
          value: 'Pakistan',
        ),
      ],
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _ContactItem({
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
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: AppTheme.secondary,
            size: 23,
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
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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

class _ContactCard extends StatelessWidget {
  const _ContactCard();

  Future<void> _openEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'iqbalnawaztech@gmail.com',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _openGitHub() async {
    final uri = Uri.parse(
      'https://github.com/iqbalnawaztech',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppTheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Get In Touch',
            style: TextStyle(
              color: AppTheme.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Connect with me through email or visit my GitHub '
                'profile to see my projects and development work.',
            style: TextStyle(
              color: AppTheme.grey,
              fontSize: 15,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 25),

          _ContactAction(
            icon: Icons.email_outlined,
            title: 'Send me an email',
            onTap: _openEmail,
          ),

          const SizedBox(height: 12),

          _ContactAction(
            icon: Icons.code,
            title: 'Visit my GitHub',
            onTap: _openGitHub,
          ),
        ],
      ),
    );
  }
}

class _ContactAction extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ContactAction({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  State<_ContactAction> createState() => _ContactActionState();
}

class _ContactActionState extends State<_ContactAction> {
  bool _isHovered = false;

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
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppTheme.background
                : AppTheme.background.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered
                  ? AppTheme.secondary
                  : AppTheme.primary.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: AppTheme.secondary,
                size: 22,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: AppTheme.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppTheme.grey,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}