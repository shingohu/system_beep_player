import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'beep_sound_method_channel.dart';

abstract class BeepSoundPlatform extends PlatformInterface {
  /// Constructs a BeepSoundPlatform.
  BeepSoundPlatform() : super(token: _token);

  static final Object _token = Object();

  static BeepSoundPlatform _instance = MethodChannelBeepSound();

  /// The default instance of [BeepSoundPlatform] to use.
  ///
  /// Defaults to [MethodChannelBeepSound].
  static BeepSoundPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BeepSoundPlatform] when
  /// they register themselves.
  static set instance(BeepSoundPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  ///[durationMs] play duration in milliseconds
  Future<void> playSysSound(int soundId, {int volume = 100, int durationMs = 200, int streamType = 3}) {
    throw UnimplementedError('playSysSound(int soundId) has not been implemented.');
  }
}
