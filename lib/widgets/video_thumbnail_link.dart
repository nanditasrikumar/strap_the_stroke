import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/video_carousel.dart';

class VideoThumbnailLink extends StatelessWidget {
  final VideoData video;

  const VideoThumbnailLink({super.key, required this.video});

  void _launchVideo() async {
    final uri = Uri.parse(video.youtubeUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchVideo,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              video.thumbnailPath,
              width: 300,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            video.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Lexend',
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
