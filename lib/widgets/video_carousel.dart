import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoData {
  final String title;
  final String description;
  final String youtubeUrl;
  final String thumbnailPath;

  VideoData({
    required this.title,
    this.description="",
    required this.youtubeUrl,
    required this.thumbnailPath,
  });
}

class VideoCarousel extends StatefulWidget {
  final List<VideoData> videos;

  const VideoCarousel({super.key, required this.videos});

  @override
  State<VideoCarousel> createState() => _VideoCarouselState();
}

class _VideoCarouselState extends State<VideoCarousel> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _goTo(int index) {
    if (index >= 0 && index < widget.videos.length) {
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
            itemCount: widget.videos.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              final video = widget.videos[index];
              final videoId = YoutubePlayer.convertUrlToId(video.youtubeUrl)!;
              final controller = YoutubePlayerController(
                initialVideoId: videoId,
                flags: const YoutubePlayerFlags(autoPlay: false),
              );

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    YoutubePlayer(controller: controller),
                    const SizedBox(height: 16),
                    Text(video.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                    const SizedBox(height: 8),
                    Text(video.description,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
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
                Text('${_currentIndex + 1} / ${widget.videos.length}'),
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
