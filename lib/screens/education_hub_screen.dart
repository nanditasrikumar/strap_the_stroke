import 'package:flutter/material.dart';
import '../base_screen.dart';

class EducationHubScreen extends StatelessWidget {
  const EducationHubScreen({super.key});

  void _handleNavTap(BuildContext context, int index) {
    final routes = ['/', '/education', '/memory-game', '/emergency'];
    final targetRoute = routes[index];

    if (ModalRoute.of(context)?.settings.name != targetRoute) {
      Navigator.pushReplacementNamed(context, targetRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Educational Hub',
      currentIndex: 1,
      onNavTap: (index) => _handleNavTap(context, index),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCard(
              context,
              title: 'Stroke Symptom Flashcards',
              icon: Icons.view_carousel,
              route: '/flashcards',
            ),
            _buildCard(
              context,
              title: 'Educational Videos',
              icon: Icons.play_circle_fill,
              route: '/videos',
            ),
            _buildCard(
              context,
              title: 'Myths vs. Facts',
              icon: Icons.fact_check,
              route: '/myths-facts',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required String title, required IconData icon, required String route}) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        leading: Icon(icon, size: 32, color: const Color(0xFFD71920)),
        title: Text(title, style: const TextStyle(fontSize: 18)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}
