import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voicevox_flutter/voicevox_flutter_method_channel.dart';

void main() {
  MethodChannelVoicevoxFlutter platform = MethodChannelVoicevoxFlutter();
  const MethodChannel channel = MethodChannel('voicevox_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
