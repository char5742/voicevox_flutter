import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:voicevox_flutter/voicevox_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class NativeVoiceService {
  Future<void> initialize() async {
    return await VoicevoxFlutter.instance.initialize(
      modelPath: await _setModel(),
      openJdkDictPath: await _setOpenJdkDict(),
      cpuNumThreads: 4,
    );
  }

  /// AudioQuery を生成する
  String audioQuery(String text, int speakerId) {
    return VoicevoxFlutter.instance.audioQuery(text, speakerId: speakerId);
  }

  /// AudioQueryから合成を実行する
  Future<String> synthesis(String query, int speakerId) async {
    final wavFile =
        File('${(await getApplicationDocumentsDirectory()).path}/voice.wav');
    final watch = Stopwatch();
    watch.start();
    await compute(_synthesis, SynthesisData(query, speakerId, wavFile.path));
    watch.stop();
    // 合成にかかった時間を表示する
    debugPrint("${watch.elapsedMilliseconds}ms");
    return wavFile.path;
  }

  /// テキスト音声合成を実行する
  Future<String> tts(String query, int speakerId) async {
    final wavFile =
        File('${(await getApplicationDocumentsDirectory()).path}/voice.wav');
    final watch = Stopwatch();
    watch.start();
    await compute(_tts, TTSData(query, speakerId, wavFile.path));
    watch.stop();
    // 合成にかかった時間を表示する
    debugPrint("${watch.elapsedMilliseconds}ms");
    return wavFile.path;
  }

  /// アセットからアプリケーションディレクトリにファイルをコピーする
  Future<void> _copyFile(
      String filename, String assetsDir, String targetDirPath) async {
    final data = await rootBundle.load('$assetsDir/$filename');
    final bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    File('$targetDirPath/$filename').writeAsBytesSync(bytes);
  }

  /// アセットからアプリケーションディレクトリに`open_jtalk_dict`をコピーする
  Future<String> _setOpenJdkDict() async {
    final openJdkDictDir = Directory(
        '${(await getApplicationSupportDirectory()).path}/open_jtalk_dic_utf_8-1.11');

    if (!openJdkDictDir.existsSync()) {
      openJdkDictDir.createSync();
      const openJdkDicAssetDir = 'assets/open_jtalk_dic_utf_8-1.11';

      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
      // open_jtalk_dic_utf_8-1.11ディレクトリ以下のファイルをコピーする
      manifestMap.keys
          .where((e) => e.contains(openJdkDicAssetDir))
          .map((e) => p.basename(e))
          .forEach((name) async {
        await _copyFile(name, openJdkDicAssetDir, openJdkDictDir.path);
      });
    }
    return openJdkDictDir.path;
  }

  /// アセットからアプリケーションディレクトリに`model`をコピーする
  Future<String> _setModel() async {
    final modelDir =
        Directory('${(await getApplicationSupportDirectory()).path}/model');
    if (!modelDir.existsSync()) {
      modelDir.createSync();
      const modelAssetDir = 'assets/model';

      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
      // modelディレクトリ以下のファイルをコピーする
      manifestMap.keys
          .where((e) => e.contains(modelAssetDir))
          .map((e) => p.basename(e))
          .forEach((name) async {
        await _copyFile(name, modelAssetDir, modelDir.path);
      });
    }
    return modelDir.path;
  }
}

class SynthesisData {
  final String query;
  final int speakerId;
  final String outputPath;
  final bool? enableInterrogativeUpspeak;
  SynthesisData(
    this.query,
    this.speakerId,
    this.outputPath, {
    this.enableInterrogativeUpspeak,
  });
}

void _synthesis(SynthesisData data) {
  VoicevoxFlutter.instance.synthesis(
    data.query,
    speakerId: data.speakerId,
    outputPath: data.outputPath,
    enableInterrogativeUpspeak: data.enableInterrogativeUpspeak ?? true,
  );
}

class TTSData {
  final String text;
  final int speakerId;
  final String outputPath;
  final bool? kana;
  final bool? enableInterrogativeUpspeak;
  TTSData(
    this.text,
    this.speakerId,
    this.outputPath, {
    this.kana,
    this.enableInterrogativeUpspeak,
  });
}

void _tts(TTSData data) {
  VoicevoxFlutter.instance.tts(
    data.text,
    speakerId: data.speakerId,
    outputPath: data.outputPath,
    kana: data.kana ?? false,
    enableInterrogativeUpspeak: data.enableInterrogativeUpspeak ?? true,
  );
}
