import 'package:flutter/material.dart';
import '../logic/audio_controller.dart';

class AudioMiniPlayer extends StatelessWidget {
  final String fileName;
  final VoidCallback onClose;
  final AudioController controller;

  const AudioMiniPlayer({
    super.key,
    required this.fileName,
    required this.controller,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade800,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.pause, color: Colors.white),
            onPressed: () => controller.pause(),
          ),
          Expanded(
            child: Text(
              fileName,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              controller.stop();
              onClose();
            },
          ),
        ],
      ),
    );
  }
}
