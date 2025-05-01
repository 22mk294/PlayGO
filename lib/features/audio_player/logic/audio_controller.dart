import 'package:just_audio/just_audio.dart';

class AudioController {
  final _player = AudioPlayer();

  Future<void> play(String filePath) async {
    await _player.setFilePath(filePath);
    _player.play();
  }

  void pause() => _player.pause();

  void stop() => _player.stop();

  void dispose() => _player.dispose();

  Stream<Duration> get positionStream => _player.positionStream;
  Stream<PlayerState> get playerStateStream => _player.playerStateStream;
}
