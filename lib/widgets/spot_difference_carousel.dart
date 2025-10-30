import 'package:flutter/material.dart';
import 'spot_difference_card.dart';
import 'spot_difference_data.dart';

class SpotDifferenceCarousel extends StatefulWidget {
  final List<SpotDifferenceData> puzzles;

  const SpotDifferenceCarousel({super.key, required this.puzzles});

  @override
  State<SpotDifferenceCarousel> createState() => _SpotDifferenceCarouselState();
}

class _SpotDifferenceCarouselState extends State<SpotDifferenceCarousel> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _goTo(int index) {
    if (index >= 0 && index < widget.puzzles.length) {
      _controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.puzzles.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              return SpotDifferenceCard(data: widget.puzzles[index]);
            },
          ),
        ),
        if (isWide)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => _goTo(_currentIndex - 1),
                ),
                Text('${_currentIndex + 1} / ${widget.puzzles.length}'),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () => _goTo(_currentIndex + 1),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

