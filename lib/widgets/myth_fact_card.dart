import 'package:flutter/material.dart';

class MythFactData {
  final String myth;
  final String fact;

  MythFactData({required this.myth, required this.fact});
}

class MythFactCard extends StatelessWidget {
  final MythFactData data;

  const MythFactCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Myth:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(height: 8),
            Text(data.myth, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 20),
            Text('Fact:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(height: 8),
            Text(data.fact, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
