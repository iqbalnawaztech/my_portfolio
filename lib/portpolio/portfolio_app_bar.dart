import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/app_theme.dart';

class PortfolioNavigation {
  static final GlobalKey homeKey = GlobalKey();
  static final GlobalKey aboutKey = GlobalKey();
  static final GlobalKey skillsKey = GlobalKey();
  static final GlobalKey projectsKey = GlobalKey();
  static final GlobalKey educationKey = GlobalKey();
  static final GlobalKey contactKey = GlobalKey();

  static void goTo(GlobalKey key) {
    final context = key.currentContext;

    if (context == null) return;

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }
}

class PortfolioAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PortfolioAppBar({super.key});

  // GitHub profile open karne ka function
  Future<void> _openGitHub() async {
    final uri = Uri.parse(
      'https://github.com/YOUR_GITHUB_USERNAME',
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

    return AppBar(
      title: const FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          'Iqbal Nawaz',
          style: TextStyle(
            color: AppTheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      actions: isMobile
          ? [
        Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: AppTheme.secondary,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          },
        ),
      ]
          : [
        _navItem(
          'Home',
          PortfolioNavigation.homeKey,
        ),

        _navItem(
          'About',
          PortfolioNavigation.aboutKey,
        ),

        _navItem(
          'Skills',
          PortfolioNavigation.skillsKey,
        ),

        _navItem(
          'Projects',
          PortfolioNavigation.projectsKey,
        ),

        _navItem(
          'Education',
          PortfolioNavigation.educationKey,
        ),

        _navItem(
          'Contact',
          PortfolioNavigation.contactKey,
        ),

        const SizedBox(width: 10),

        // GitHub Button
        OutlinedButton.icon(
          onPressed: _openGitHub,
          icon: const Icon(
            Icons.code,
            size: 18,
          ),
          label: const Text('GitHub'),
        ),

        const SizedBox(width: 15),
      ],
    );
  }

  Widget _navItem(
      String title,
      GlobalKey key,
      ) {
    return TextButton(
      onPressed: () {
        PortfolioNavigation.goTo(key);
      },
      child: Text(
        title,
        style: const TextStyle(
          color: AppTheme.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
    kToolbarHeight,
  );
}

class PortfolioDrawer extends StatelessWidget {
  const PortfolioDrawer({super.key});

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
    return Drawer(
      backgroundColor: AppTheme.background,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                'IQ',
                style: TextStyle(
                  color: AppTheme.secondary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            _drawerItem(
              context,
              'Home',
              Icons.home,
              PortfolioNavigation.homeKey,
            ),

            _drawerItem(
              context,
              'About',
              Icons.person,
              PortfolioNavigation.aboutKey,
            ),

            _drawerItem(
              context,
              'Skills',
              Icons.code,
              PortfolioNavigation.skillsKey,
            ),

            _drawerItem(
              context,
              'Projects',
              Icons.work,
              PortfolioNavigation.projectsKey,
            ),

            _drawerItem(
              context,
              'Education',
              Icons.school,
              PortfolioNavigation.educationKey,
            ),

            _drawerItem(
              context,
              'Contact',
              Icons.email,
              PortfolioNavigation.contactKey,
            ),

            const Divider(
              color: AppTheme.grey,
            ),

            // GitHub
            ListTile(
              leading: const Icon(
                Icons.code,
                color: AppTheme.secondary,
              ),
              title: const Text(
                'GitHub',
                style: TextStyle(
                  color: AppTheme.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                _openGitHub();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
      BuildContext context,
      String title,
      IconData icon,
      GlobalKey key,
      ) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppTheme.secondary,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppTheme.white,
        ),
      ),
      onTap: () {
        Navigator.pop(context);

        PortfolioNavigation.goTo(key);
      },
    );
  }
}