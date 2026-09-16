import 'package:flutter/material.dart';
import 'package:iqbal_portfolio/portpolio/about_section.dart';
import 'package:iqbal_portfolio/portpolio/contact_section.dart';
import 'package:iqbal_portfolio/portpolio/education_section.dart';
import 'package:iqbal_portfolio/portpolio/footer_section.dart';
import 'package:iqbal_portfolio/portpolio/hero_section.dart';
import 'package:iqbal_portfolio/portpolio/portfolio_app_bar.dart';
import 'package:iqbal_portfolio/portpolio/projects_section.dart';
import 'package:iqbal_portfolio/portpolio/skills_section.dart';

// import '../widgets/portfolio/portfolio_app_bar.dart';
// import '../widgets/portfolio/hero_section.dart';
// import '../widgets/portfolio/about_section.dart';
// import '../widgets/portfolio/skills_section.dart';
// import '../widgets/portfolio/projects_section.dart';
// import '../widgets/portfolio/education_section.dart';
// import '../widgets/portfolio/contact_section.dart';
// import '../widgets/portfolio/footer_section.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PortfolioAppBar(),

      endDrawer: const PortfolioDrawer(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            KeyedSubtree(
              key: PortfolioNavigation.homeKey,
              child: const HeroSection(),
            ),
            KeyedSubtree(
              key: PortfolioNavigation.aboutKey,
              child: const AboutSection(),
            ),
            KeyedSubtree(
              key: PortfolioNavigation.skillsKey,
              child: const SkillsSection(),
            ),
            KeyedSubtree(
              key: PortfolioNavigation.projectsKey,
              child: const ProjectsSection(),
            ),
            KeyedSubtree(
              key: PortfolioNavigation.educationKey,
              child: const EducationSection(),
            ),
            KeyedSubtree(
              key: PortfolioNavigation.contactKey,
              child: const ContactSection(),
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}