import 'package:flutter/material.dart';
import '../base_screen.dart';

class ChallengeResultsScreen extends StatelessWidget {
  const ChallengeResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'ChallengeResultsScreen',
      currentIndex: 0,
      onNavTap: (index) {
        // TODO: Handle navigation
      },
      body: const Center(
        child: Text(
          'ChallengeResultsScreen Screen Placeholder',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
