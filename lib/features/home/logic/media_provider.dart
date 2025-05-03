import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MediaProvider extends ChangeNotifier {
  final List<File> _audioFiles = [];
  final List<File> _videoFiles = [];

  List<File> get audioFiles => _audioFiles;
  List<File> get videoFiles => _videoFiles;

  MediaProvider() {
    _loadSavedMedia();
  }

  void addMediaFiles(List<File> files) async {
    final prefs = await SharedPreferences.getInstance();

    for (var file in files) {
      if (_isAudio(file)) {
        _audioFiles.add(file);
      } else if (_isVideo(file)) {
        _videoFiles.add(file);
      }
    }

    // Sauvegarde les chemins
    final audioPaths = _audioFiles.map((f) => f.path).toList();
    final videoPaths = _videoFiles.map((f) => f.path).toList();

    await prefs.setStringList('audio_files', audioPaths);
    await prefs.setStringList('video_files', videoPaths);

    notifyListeners();
  }

  void _loadSavedMedia() async {
    final prefs = await SharedPreferences.getInstance();
    final audioPaths = prefs.getStringList('audio_files') ?? [];
    final videoPaths = prefs.getStringList('video_files') ?? [];

    _audioFiles.clear();
    _videoFiles.clear();

    _audioFiles.addAll(audioPaths.map((path) => File(path)));
    _videoFiles.addAll(videoPaths.map((path) => File(path)));

    notifyListeners();
  }

  bool _isAudio(File file) {
    final ext = file.path.split('.').last.toLowerCase();
    return ['mp3', 'wav', 'aac', 'ogg'].contains(ext);
  }

  bool _isVideo(File file) {
    final ext = file.path.split('.').last.toLowerCase();
    return ['mp4', 'avi', 'mov', 'mkv'].contains(ext);
  }
}
