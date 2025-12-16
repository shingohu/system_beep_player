import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'beep_sound_platform_interface.dart';

/// An implementation of [BeepSoundPlatform] that uses method channels.
class MethodChannelBeepSound extends BeepSoundPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('system_beep_player');

  @override
  ///[durationMs] play duration in milliseconds
  Future<void> playSysSound(int soundId, {int volume = 100, int durationMs = 200, int streamType = 3}) async {
    return methodChannel.invokeMethod('playSysSound', {
      "soundId": soundId,
      "volume": volume,
      "duration": durationMs,
      "streamType": streamType,
    });
  }
}
