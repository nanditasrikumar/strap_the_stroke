import 'package:flutter/material.dart';
import 'spot_difference_data.dart';

class SpotDifferenceCard extends StatefulWidget {
  final SpotDifferenceData data;

  const SpotDifferenceCard({super.key, required this.data});

  @override
  State<SpotDifferenceCard> createState() => _SpotDifferenceCardState();
}

class _SpotDifferenceCardState extends State<SpotDifferenceCard> {
  bool _showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(widget.data.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(height: 8),
            Text(widget.data.description,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(widget.data.imageLeft, fit: BoxFit.contain),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Image.asset(
                      _showAnswer
                          ? widget.data.imageRight.replaceFirst('.png', '_answer.png')
                          : widget.data.imageRight,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => setState(() => _showAnswer = !_showAnswer),
              icon: Icon(_showAnswer ? Icons.visibility_off : Icons.visibility),
              label: Text(_showAnswer ? 'Hide Answer' : 'Reveal Answer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD71920),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
