import 'package:audioplayers/audioplayers.dart';

class RepetetiveAudioPlayer {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final String audioPath;
  bool _paused = false;
  double _waitTime = 1;

  RepetetiveAudioPlayer(this.audioPath);

  void setWaitTime(double newWait) {
    _waitTime = newWait;
  }

  void changeWaitTime(double delta) {
    if (_waitTime + delta >= 0) {
      _waitTime += delta;
    }
  }

  void run() async {
    while (!_paused) {
      await _singleAudioStep();
    }
  }

  Future<void> _singleAudioStep() async {
    await _audioPlayer.play(AssetSource(audioPath));
    _audioPlayer.setPlaybackRate(5);

    await Future.delayed(Duration(milliseconds: (_waitTime * 1000).floor()));
  }
}
