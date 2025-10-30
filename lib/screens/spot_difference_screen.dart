import 'package:flutter/material.dart';
import '../base_screen.dart';
import '../widgets/befast_banner.dart';
import '../widgets/spot_difference_carousel.dart';
import '../widgets/spot_difference_data.dart';

class SpotDifferenceScreen extends StatelessWidget {
  const SpotDifferenceScreen({super.key});

  void _handleNavTap(BuildContext context, int index) {
    final routes = ['/', '/education', '/memory-game', '/emergency'];
    final targetRoute = routes[index];

    if (ModalRoute.of(context)?.settings.name != targetRoute) {
      Navigator.pushReplacementNamed(context, targetRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final puzzles = [
      SpotDifferenceData(
        title: 'Challange #1 ',
        description: 'Can you spot 1 difference between these two images and identify the symptom?',
        imageLeft: 'assets/spot_diff_face_dropping_left.png',
        imageRight: 'assets/spot_diff_face_dropping_right.png',
      ),
      SpotDifferenceData(
        title: 'Challange #2 ',
        description: 'Can you spot 2 difference between these two images and identify the symptom?',
        imageLeft: 'assets/spot_diff_arm_stretch_left.png',
        imageRight: 'assets/spot_diff_arm_stretch_right.png',
      ),
      // Add more puzzles as needed
    ];

    return BaseScreen(
      title: 'Spot the Difference',
      currentIndex: 2,
      onNavTap: (index) => _handleNavTap(context, index),
      body: Column(
        children: [
          const BEFASTBanner(),
          Expanded(child: SpotDifferenceCarousel(puzzles: puzzles)),
        ],
      ),

 

    );
  }
}
