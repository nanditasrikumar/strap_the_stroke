import 'package:flutter/material.dart';
import 'package:strap_the_stoke/screens/homescreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // background-light
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header with icon and title
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.school, color: Color(0xFFD91F26), size: 32), // primary
                SizedBox(width: 8),
                Text(
                  'S.T.R.A.P the Stroke',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333), // text-light
                    fontFamily: 'Lexend',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Image section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: const Color(0xFFFBE9EA), // primary-light
                borderRadius: BorderRadius.circular(24),
                image: const DecorationImage(
                  image: AssetImage('assets/welcome.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Welcome text
            const Text(
              'Welcome to S.T.R.A.P the Stroke',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Color(0xFFD91F26), // primary
                fontFamily: 'Lexend',
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Join us to learn the signs and help save lives. Together, we can end stroke.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6b7280), // text-muted-light
                fontFamily: 'Lexend',
              ),
            ),
            const Spacer(),
            // Start Learning button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD91F26), // primary
                  minimumSize: const Size.fromHeight(56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 6,
                  shadowColor: const Color(0xFFD91F26).withOpacity(0.3),
                ),
                onPressed: () {
                  // TODO: Navigate to next screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );                  
                },
                child: const Text(
                  'Start Learning',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFD71920),
        unselectedItemColor: const Color(0xFF6B7280),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Education'),
          BottomNavigationBarItem(icon: Icon(Icons.videogame_asset), label: 'Game'),
          BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: 'Emergency'),
        ],
      ),

    );
  }
}
