import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:voicevox_flutter/voicevox_flutter.dart';
import 'package:path_provider/path_provider.dart';

class NativeVoiceService {
  Future<String> audioQuery(String text, [int speaker = 0]) async {
    return await VoicevoxFlutter.instance.audioQuery(text);
  }

  Future<String> synthesis(String query) async {
    final wavFile =
        File('${(await getApplicationDocumentsDirectory()).path}/voice.wav');
    final watch = Stopwatch();
    watch.start();
    await VoicevoxFlutter.instance.synthesis(query, wavFile.path);
    watch.stop();
    debugPrint("${watch.elapsedMilliseconds}ms");
    return wavFile.path;
  }

  Future<void> initialize() async {
    return await VoicevoxFlutter.instance.initialize(
      modelPath: await _setModel(),
      openJdkDictPath: await _setOpenJdkDict(),
      cpuNumThreads: 4,
    );
  }

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
      await _copyFile('char.bin', openJdkDicAssetDir, openJdkDictDir.path);
      await _copyFile('COPYING', openJdkDicAssetDir, openJdkDictDir.path);
      await _copyFile('left-id.def', openJdkDicAssetDir, openJdkDictDir.path);
      await _copyFile('matrix.bin', openJdkDicAssetDir, openJdkDictDir.path);
      await _copyFile('pos-id.def', openJdkDicAssetDir, openJdkDictDir.path);
      await _copyFile('rewrite.def', openJdkDicAssetDir, openJdkDictDir.path);
      await _copyFile('right-id.def', openJdkDicAssetDir, openJdkDictDir.path);
      await _copyFile('sys.dic', openJdkDicAssetDir, openJdkDictDir.path);
      await _copyFile('unk.dic', openJdkDicAssetDir, openJdkDictDir.path);
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
      await _copyFile('metas.json', modelAssetDir, modelDir.path);
      await _copyFile('predict_duration-0.onnx', modelAssetDir, modelDir.path);
      await _copyFile('predict_duration-1.onnx', modelAssetDir, modelDir.path);
      await _copyFile(
          'predict_intonation-0.onnx', modelAssetDir, modelDir.path);
      await _copyFile(
          'predict_intonation-1.onnx', modelAssetDir, modelDir.path);
      await _copyFile('decode-0.onnx', modelAssetDir, modelDir.path);
      await _copyFile('decode-1.onnx', modelAssetDir, modelDir.path);
    }
    return modelDir.path;
  }
}
