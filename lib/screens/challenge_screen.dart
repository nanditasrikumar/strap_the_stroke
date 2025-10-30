import 'package:flutter/material.dart';
import '../base_screen.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'ChallengeScreen',
      currentIndex: 0,
      onNavTap: (index) {
        // TODO: Handle navigation
      },
      body: const Center(
        child: Text(
          'ChallengeScreen Screen Placeholder',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
