import 'package:flutter/material.dart';
import 'package:iqbal_portfolio/screens/portfolio_screen.dart';

import 'screens/portfolio_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Iqbal Nawaz | Flutter Developer',
      theme: AppTheme.appTheme,
      home: const PortfolioScreen(),
    );
  }
}