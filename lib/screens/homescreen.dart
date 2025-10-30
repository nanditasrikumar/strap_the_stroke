import 'package:flutter/material.dart';
import '../base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateByIndex(BuildContext context, int index) {
    final routes = ['/', '/education', '/memory-game', '/emergency'];
    Navigator.pushReplacementNamed(context, routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> gridItems = [
      {'label': 'Educational Content', 'image': 'assets/education.png'},
//      {'label': 'Memory Game', 'image': 'assets/memory_game.png'},
      {'label': 'Spot the Difference', 'image': 'assets/spot_the_diff_start_game.png'},
      {'label': 'Emergency Contacts', 'image': 'assets/emergency.png'},
    ];
    return BaseScreen(
      title: 'S.T.R.A.P the Stroke',
      currentIndex: 0,
      onNavTap: (index) =>  navigateByIndex(context, index),

      // body: Padding(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🧱 Grid Section
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: gridItems.map((item) {
                  return GestureDetector(
                    onTap: () {
                      // TODO: Navigate to respective screen
                      final label = item['label'];
                      if (label == 'Educational Content') {
                        Navigator.pushNamed(context, '/education');
                      } else if (label == 'Memory Game') {
                        Navigator.pushNamed(context, '/memory-game');
                      } else if (label == 'Spot the Difference') {
                        Navigator.pushNamed(context, '/spot-difference');
                      } else if (label == 'Emergency Contacts') {
                        Navigator.pushNamed(context, '/emergency');
                      }                     
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: AssetImage(item['image']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['label']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lexend',
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              // 🩺 F.A.S.T. Banner Section
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFBE8E8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Know the Signs: B.E.F.A.S.T',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD71920),
                        fontFamily: 'Lexend',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Balance, Eye Drooping, Face Drooping, Arm Weakness, Speech Difficulty,\nTime to call 911.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
