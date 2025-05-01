import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../../../core/widgets/app_top_bar.dart';
import '../logic/video_controller.dart';
import '../../home/logic/media_provider.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final VideoController _controller = VideoController();
  int? _currentIndex;

  @override
  void dispose() {
    if (_controller.isInitialized) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _playVideo(File file, int index) async {
    _currentIndex = index;
    await _controller.load(file.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final videoFiles = context.watch<MediaProvider>().videoFiles;

    return Scaffold(
      appBar: const AppTopBar(title: "Vidéo"),
      body: Column(
        children: [
          if (_controller.isInitialized)
            AspectRatio(
              aspectRatio: _controller.controller.value.aspectRatio,
              child: VideoPlayer(_controller.controller),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: videoFiles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(videoFiles[index].path.split('/').last),
                  trailing: IconButton(
                    icon: const Icon(Icons.play_circle),
                    onPressed: () => _playVideo(videoFiles[index], index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
