import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/app_top_bar.dart';
import '../logic/audio_controller.dart';
import 'package:playgo/features/home/logic/media_provider.dart';
import 'audio_mini_player.dart'; // ← ajoute ce fichier

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioController _controller = AudioController();
  int? _currentIndex;
  File? _currentFile;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAudio(File file, int index) {
    _currentIndex = index;
    _currentFile = file;
    _controller.play(file.path);
    setState(() {});
  }

  void _closeMiniPlayer() {
    _currentFile = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final audioFiles = context.watch<MediaProvider>().audioFiles;

    return Scaffold(
      appBar: const AppTopBar(title: "Audio"),
      body: Stack(
        children: [
          audioFiles.isEmpty
              ? const Center(child: Text("Aucun fichier audio trouvé."))
              : ListView.builder(
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: audioFiles.length,
            itemBuilder: (context, index) {
              final file = audioFiles[index];
              return ListTile(
                title: Text(file.path.split('/').last),
                onTap: () => _playAudio(file, index),
              );
            },
          ),
          if (_currentFile != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: AudioMiniPlayer(
                fileName: _currentFile!.path.split('/').last,
                controller: _controller,
                onClose: _closeMiniPlayer,
              ),
            ),
        ],
      ),
    );
  }
}
