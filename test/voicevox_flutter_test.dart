import 'package:flutter_test/flutter_test.dart';
import 'package:voicevox_flutter/voicevox_flutter.dart';
import 'package:voicevox_flutter/voicevox_flutter_platform_interface.dart';
import 'package:voicevox_flutter/voicevox_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockVoicevoxFlutterPlatform
    with MockPlatformInterfaceMixin
    implements VoicevoxFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final VoicevoxFlutterPlatform initialPlatform = VoicevoxFlutterPlatform.instance;

  test('$MethodChannelVoicevoxFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelVoicevoxFlutter>());
  });

  test('getPlatformVersion', () async {
    VoicevoxFlutter voicevoxFlutterPlugin = VoicevoxFlutter();
    MockVoicevoxFlutterPlatform fakePlatform = MockVoicevoxFlutterPlatform();
    VoicevoxFlutterPlatform.instance = fakePlatform;

    expect(await voicevoxFlutterPlugin.getPlatformVersion(), '42');
  });
}
