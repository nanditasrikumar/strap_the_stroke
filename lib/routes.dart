import 'package:flutter/material.dart';
import 'screens/homescreen.dart';
import 'screens/education_hub_screen.dart';
import 'screens/flashcard_screen.dart';
import 'screens/video_player_screen.dart';
import 'screens/memory_game_screen.dart';
import 'screens/game_results_screen.dart';
import 'screens/challenge_screen.dart';
import 'screens/challenge_results_screen.dart';
import 'screens/emergency_screen.dart';
import 'screens/myths_facts_screen.dart';
import 'screens/spot_difference_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/home': (context) => const HomeScreen(),
  '/education': (context) => const EducationHubScreen(),
  '/flashcards': (context) => const FlashcardScreen(),
  '/videos': (context) => const VideoPlayerScreen(),
  '/memory-game': (context) => const MemoryGameScreen(),
  '/spot-difference': (context) => const SpotDifferenceScreen(),
  '/game-results': (context) => const GameResultsScreen(),
  '/challenge': (context) => const ChallengeScreen(),
  '/challenge-results': (context) => const ChallengeResultsScreen(),
  '/emergency': (context) => const EmergencyScreen(),
  '/myths-facts': (context) => const MythFactScreen(),

};
