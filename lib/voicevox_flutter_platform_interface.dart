import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'voicevox_flutter_method_channel.dart';

abstract class VoicevoxFlutterPlatform extends PlatformInterface {
  /// Constructs a VoicevoxFlutterPlatform.
  VoicevoxFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static VoicevoxFlutterPlatform _instance = MethodChannelVoicevoxFlutter();

  /// The default instance of [VoicevoxFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelVoicevoxFlutter].
  static VoicevoxFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VoicevoxFlutterPlatform] when
  /// they register themselves.
  static set instance(VoicevoxFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> setModelPath(String path) {
    throw UnimplementedError('setModelPath() has not been implemented.');
  }
}
