import 'dart:js_interop';

import 'package:web/web.dart' as web;

class BirthdayAudioPlayer {
  BirthdayAudioPlayer()
      : _audio = web.HTMLAudioElement()
          ..src = 'assets/assets/audio/drip_chorus.mp3' {
    _audio.loop = true;
    _audio.preload = 'none';
  }

  final web.HTMLAudioElement _audio;

  bool get isPlaying => !_audio.paused;

  Future<bool> toggle() async {
    if (isPlaying) {
      _audio.pause();
      return false;
    }

    await _audio.play().toDart;
    return true;
  }

  void dispose() {
    _audio.pause();
    _audio.remove();
  }
}
