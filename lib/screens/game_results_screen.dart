import 'package:flutter/material.dart';
import '../base_screen.dart';

class GameResultsScreen extends StatelessWidget {
  const GameResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'GameResultsScreen',
      currentIndex: 0,
      onNavTap: (index) {
        // TODO: Handle navigation
      },
      body: const Center(
        child: Text(
          'GameResultsScreen Screen Placeholder',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
