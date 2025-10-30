import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
   final BuildContext context;
  final int currentIndex;

  const CustomBottomNav({
    super.key,
    required this.context,
    required this.currentIndex,
  });

  void _navigate(int index) {
    final routes = ['/', '/education', '/spot-difference', '/emergency'];
    final targetRoute = routes[index];

    // Prevent navigation only if already on the target route
    if (ModalRoute.of(context)?.settings.name != targetRoute) {
      Navigator.pushReplacementNamed(context, targetRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: _navigate,
      selectedItemColor: const Color(0xFFD71920),
      unselectedItemColor: const Color(0xFF6B7280),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Education'),
        BottomNavigationBarItem(icon: Icon(Icons.videogame_asset), label: 'Game'),
        BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: 'Emergency'),
      ],
    );
  }
}