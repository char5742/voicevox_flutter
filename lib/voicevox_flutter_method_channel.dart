import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'voicevox_flutter_platform_interface.dart';

/// An implementation of [VoicevoxFlutterPlatform] that uses method channels.
class MethodChannelVoicevoxFlutter extends VoicevoxFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('voicevox_flutter');

  @override
  Future<void> setModelPath(String path) async {
    await methodChannel.invokeMethod('setModelPath', {"path": path});
  }
}
