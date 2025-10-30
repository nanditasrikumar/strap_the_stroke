import 'package:flutter/material.dart';
import '../base_screen.dart';
import '../widgets/befast_banner.dart';
import '../widgets/myth_fact_carousel.dart';
import '../widgets/myth_fact_card.dart';
class MythFactScreen extends StatelessWidget {
  const MythFactScreen({super.key});

  void _handleNavTap(BuildContext context, int index) {
    final routes = ['/', '/education', '/memory-game', '/emergency'];
    final targetRoute = routes[index];

    if (ModalRoute.of(context)?.settings.name != targetRoute) {
      Navigator.pushReplacementNamed(context, targetRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      MythFactData(
        myth: 'Strokes only happen to older people.',
        fact: 'Strokes can happen at any age—even children and babies can have strokes.',
      ),
      MythFactData(
        myth: 'A stroke always causes pain.',
        fact: 'Most strokes are painless. Symptoms like numbness or confusion may occur instead.',
      ),
      MythFactData(
        myth: 'You can wait to see if stroke symptoms go away.',
        fact: 'Every second counts. Call emergency services immediately if symptoms appear.',
      ),
      MythFactData(
        myth: 'Strokes are rare in kids.',
        fact: 'Thousands of children experience strokes each year. Awareness helps early detection.',
      ),
      MythFactData(
        myth: 'If someone can talk, they’re not having a stroke.',
        fact: 'Speech may still be affected. Slurred or confused speech is a warning sign.',
      ),
      MythFactData(
        myth: 'Recovery from stroke is impossible.',
        fact: 'Many people recover with therapy and support. Early treatment improves outcomes.',
      ),
    ];

    return BaseScreen(
      title: 'Myths vs. Facts',
      currentIndex: 1,
      onNavTap: (index) => _handleNavTap(context, index),
      body: Column(
        children: [
          const BEFASTBanner(),
          Expanded(child: MythFactCarousel(items: items)),
        ],
      ),
    );
  }
}
