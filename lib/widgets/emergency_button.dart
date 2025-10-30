import 'package:flutter/material.dart';

class EmergencyButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const EmergencyButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        backgroundColor: const Color(0xFFD71920),
      ),
      icon: Icon(icon, size: 28),
      label: Text(label, style: const TextStyle(fontSize: 18)),
      onPressed: onPressed,
    );
  }
}
