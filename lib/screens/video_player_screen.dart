import 'package:flutter/material.dart';
import '../base_screen.dart';
import '../widgets/befast_banner.dart';
import '../widgets/video_carousel.dart';
import '../widgets/video_thumbnail_link.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});


  void _handleNavTap(BuildContext context, int index) {
    final routes = ['/', '/education', '/memory-game', '/emergency'];
    final targetRoute = routes[index];

    if (ModalRoute.of(context)?.settings.name != targetRoute) {
      Navigator.pushReplacementNamed(context, targetRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final videos = [
      VideoData(
        title: 'What is a Stroke? (Childhood Stroke Project)',
        description: 'Animated video explaining stroke for kids by Stroke Association & Evelina London.',
        youtubeUrl: 'https://www.youtube.com/watch?v=mD2QZQtmvGA',
        thumbnailPath: 'assets/video_thumbnail_what_is_stroke.png',
      ),
      VideoData(
        title: 'Stroke Explained for Kids | AumSum',
        description: 'Fun science-style animation explaining stroke symptoms and causes.',
        youtubeUrl: 'https://www.youtube.com/watch?v=9UB7cFDvm4I',
        thumbnailPath: 'assets/video_thumbnail_stroke_explained_for_kids.png',
      ),
      VideoData(
        title: 'What Happens During a Stroke | TED-Ed',
        description: 'Educational breakdown of stroke mechanics and symptoms.',
        youtubeUrl: 'https://www.youtube.com/watch?v=QdaT3z2uIuI',
        thumbnailPath: 'assets/video_thumbnail_what_happens_during_stroke.png',
      ),
      VideoData(
        title: 'Tutu’s Quick Thinking | Stroke Awareness Cartoon',
        description: 'Heartwarming story of a child recognizing stroke signs and saving her mom.',
        youtubeUrl: 'https://www.youtube.com/watch?v=U9Fkl574z64',
        thumbnailPath: 'assets/video_thumbnail_tutus_quick_thinking.png',
      ),
      VideoData(
        title: 'Understanding Stroke in Kids | Boston Children’s Hospital',
        description: 'Animated explainer on pediatric stroke and treatment.',
        youtubeUrl: 'https://www.youtube.com/watch?v=QdaT3z2uIuI',
        thumbnailPath: 'assets/video_thumbnail_stroke_explained_for_kids.png',
      ),
      VideoData(
        title: 'Stroke Symptoms & F.A.S.T. Response',
        description: 'Simple breakdown of the F.A.S.T. acronym and emergency response.',
        youtubeUrl: 'https://www.youtube.com/watch?v=8yiqr12yJZ4',
        thumbnailPath: 'assets/video_thumbnail_stroke_symptoms_and_fast_response.png',
      ),
    ];

  // #to get thumbnail image
  // #https://img.youtube.com/vi/8yiqr12yJZ4/maxresdefault.jpg

    return BaseScreen(
      title: 'Educational Videos',
      currentIndex: 1,
      onNavTap: (index) => _handleNavTap(context, index),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const BEFASTBanner(),
                  const SizedBox(height: 24),
                  ...videos.map((video) => VideoThumbnailLink(video: video)).toList(),
                ],
              ),
            ),
        ),
        ),
      ),
    );
  }
}
