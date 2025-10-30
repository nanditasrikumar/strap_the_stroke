import 'package:flutter/material.dart';
import 'myth_fact_card.dart';

class MythFactCarousel extends StatefulWidget {
  final List<MythFactData> items;

  const MythFactCarousel({super.key, required this.items});

  @override
  State<MythFactCarousel> createState() => _MythFactCarouselState();
}

class _MythFactCarouselState extends State<MythFactCarousel> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _goTo(int index) {
    if (index >= 0 && index < widget.items.length) {
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
            itemCount: widget.items.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              return MythFactCard(data: widget.items[index]);
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
                Text('${_currentIndex + 1} / ${widget.items.length}'),
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
