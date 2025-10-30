import 'package:flutter/material.dart';
import '../base_screen.dart';

class MemoryGameScreen extends StatelessWidget {
  const MemoryGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'MemoryGameScreen',
      currentIndex: 2,
      onNavTap: (index) {
        // TODO: Handle navigation
      },
      body: const Center(
        child: Text(
          'MemoryGameScreen Screen Placeholder',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
