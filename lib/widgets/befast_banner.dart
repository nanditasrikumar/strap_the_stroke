import 'package:flutter/material.dart';

class BEFASTBanner extends StatelessWidget {
  const BEFASTBanner({super.key});

  final List<Map<String, String>> items = const [
    {'letter': 'B', 'label': 'Balance'},
    {'letter': 'E', 'label': 'Eyes'},
    {'letter': 'F', 'label': 'Face'},
    {'letter': 'A', 'label': 'Arms'},
    {'letter': 'S', 'label': 'Speech'},
    {'letter': 'T', 'label': 'Time'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) {
          return Column(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFFD71920),
                child: Text(
                  item['letter']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item['label']!,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
