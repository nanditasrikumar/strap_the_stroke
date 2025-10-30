import 'package:flutter/material.dart';
import '../base_screen.dart';
import '../widgets/flashcard_carousel.dart';
import '../widgets/befast_banner.dart';

class FlashcardScreen extends StatelessWidget {
  const FlashcardScreen({super.key});

  void _handleNavTap(BuildContext context, int index) {
    final routes = ['/', '/education', '/memory-game', '/emergency'];
    final targetRoute = routes[index];

    if (ModalRoute.of(context)?.settings.name != targetRoute) {
      Navigator.pushReplacementNamed(context, targetRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cards = [
      FlashcardData(
        title: 'Balance Loss',
        description: 'Sudden loss of balance or coordination. The person may stumble or have trouble walking.',
        imageAsset: 'assets/balance_loss.png',
      ),
      FlashcardData(
        title: 'Eye Drooping or Vision Trouble',
        description: 'Sudden blurred or double vision in one or both eyes, or drooping eyelid.',
        imageAsset: 'assets/eye_drooping.png',
      ),
      FlashcardData(
        title: 'Face Drooping',
        description: 'One side of the face may droop or feel numb. Ask the person to smile.',
        imageAsset: 'assets/face_drooping.png',
      ),
      FlashcardData(
        title: 'Arm Weakness',
        description: 'One arm may be weak or numb. Ask the person to raise both arms.',
        imageAsset: 'assets/arm_weakness.png',
      ),
      FlashcardData(
        title: 'Speech Difficulty',
        description: 'Speech may be slurred or hard to understand. Ask the person to repeat a simple sentence.',
        imageAsset: 'assets/speech_difficulty.png',
      ),
      FlashcardData(
        title: 'Time to Call 911',
        description: 'If someone shows any of these symptoms, even if they go away, call emergency services immediately.',
        imageAsset: 'assets/call_911.png',
      ),
    ];

    return BaseScreen(
      title: 'Stroke Symptom Flashcards',
      currentIndex: 1,
      onNavTap: (index) => _handleNavTap(context, index),
      body: Column(
        
          children: [
            const BEFASTBanner(),
            Expanded(child: FlashcardCarousel(cards: cards)),
          ],
          
      ),      
//      body: FlashcardCarousel(cards: cards),

      
    );
  }
}
