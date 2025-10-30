import 'package:flutter/material.dart';

class FlashcardData {
  final String title;
  final String description;
  final String imageAsset;

  FlashcardData({
    required this.title,
    required this.description,
    required this.imageAsset,
  });
}

class FlashcardCarousel extends StatefulWidget {
  final List<FlashcardData> cards;

  const FlashcardCarousel({super.key, required this.cards});

  @override
  State<FlashcardCarousel> createState() => _FlashcardCarouselState();
}

class _FlashcardCarouselState extends State<FlashcardCarousel> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _goTo(int index) {
    if (index >= 0 && index < widget.cards.length) {
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
            itemCount: widget.cards.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              final card = widget.cards[index];
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.asset(
                            card.imageAsset,
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(card.title,
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                            const SizedBox(height: 8),
                            Text(card.description,
                                style: Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
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
                Text('${_currentIndex + 1} / ${widget.cards.length}'),
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
