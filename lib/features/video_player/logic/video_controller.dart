import 'dart:io';

import 'package:video_player/video_player.dart';

class VideoController {
  late VideoPlayerController controller;

  Future<void> load(String path) async {
    controller = VideoPlayerController.file(File(path));
    await controller.initialize();
    controller.play();
  }

  void pause() => controller.pause();

  void dispose() => controller.dispose();

  bool get isInitialized => controller.value.isInitialized;
  bool get isPlaying => controller.value.isPlaying;
}
