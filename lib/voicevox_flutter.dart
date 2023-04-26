import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

import 'generated_bindings.dart';
import 'voicevox_flutter_platform_interface.dart';

/// VoicevoxCoreLibraryのラッパークラス
class VoicevoxFlutter extends VoicevoxCoreLibrary {
  static final VoicevoxFlutter instance = VoicevoxFlutter._(DynamicLibrary.open(
      Platform.isAndroid ? 'libvoicevox_core.so' : 'libvoicevox_core.dylib'));
  VoicevoxFlutter._(super.dynamicLibrary);

  Future<void> initialize({
    required String modelPath,
    required String openJdkDictPath,
    int? cpuNumThreads,
    bool loadAllModels = true,
  }) async {
    await VoicevoxFlutterPlatform.instance.setModelPath(modelPath);
    final option = voicevox_make_default_initialize_options();
    final openJdkDictPathPtr = openJdkDictPath.toNativeUtf8();
    option
      ..acceleration_mode =
          VoicevoxAccelerationMode.VOICEVOX_ACCELERATION_MODE_CPU
      ..cpu_num_threads = cpuNumThreads ?? 0
      ..load_all_models = loadAllModels
      ..open_jtalk_dict_dir = openJdkDictPathPtr.cast<Char>();
    final code = voicevox_initialize(option);

    malloc.free(openJdkDictPathPtr);
    if (code != VoicevoxResultCode.VOICEVOX_RESULT_OK) {
      throw Exception('VoicevoxResult: ${errorcodeToText(code)}');
    }
  }

  /// AudioQuery を実行する
  ///
  /// [text] テキスト
  ///
  /// [speakerId] 話者ID
  ///
  /// [kana] aquestalk形式のkanaとしてテキストを解釈する
  String audioQuery(
    String text, {
    required int speakerId,
    bool kana = false,
  }) {
    final defaultQueryOption = voicevox_make_default_audio_query_options();
    defaultQueryOption.kana = kana;
    Pointer<Pointer<Char>> outputPtr = calloc<Pointer<Char>>();
    final code = voicevox_audio_query(
      text.toNativeUtf8().cast<Char>(),
      speakerId,
      defaultQueryOption,
      outputPtr,
    );
    if (code != VoicevoxResultCode.VOICEVOX_RESULT_OK) {
      throw Exception('VoicevoxResult: ${errorcodeToText(code)}');
    }
    final query = outputPtr.value.cast<Utf8>().toDartString();
    calloc.free(outputPtr);
    return query;
  }

  /// AudioQuery から音声合成する
  ///
  /// [query] jsonフォーマットされた AudioQuery
  ///
  /// [speakerId] 話者ID
  ///
  /// [outputPath] 出力ファイルパス
  void synthesis(
    String query, {
    required int speakerId,
    required String outputPath,
    bool enableInterrogativeUpspeak = true,
  }) {
    final synthesisOptions = voicevox_make_default_synthesis_options();
    synthesisOptions.enable_interrogative_upspeak = enableInterrogativeUpspeak;
    final Pointer<UintPtr> outputWavLengthPtr = calloc<UintPtr>();
    Pointer<Pointer<Uint8>> outputWavPtr = calloc<Pointer<Uint8>>();
    final queryPtr = query.toNativeUtf8();
    final code = voicevox_synthesis(
      queryPtr.cast<Char>(),
      speakerId,
      synthesisOptions,
      outputWavLengthPtr,
      outputWavPtr,
    );
    if (code != VoicevoxResultCode.VOICEVOX_RESULT_OK) {
      throw Exception('VoicevoxResult: ${errorcodeToText(code)}');
    }
    final wavFile = File(outputPath);

    wavFile.writeAsBytesSync(
        outputWavPtr.value.asTypedList(outputWavLengthPtr.value));

    calloc.free(outputWavLengthPtr);
    calloc.free(outputWavPtr);
  }

  /// テキスト音声合成を実行する
  ///
  /// [text] テキスト
  ///
  /// [speakerId] 話者ID
  ///
  /// [outputPath] 出力ファイルパス
  ///
  /// [kana] aquestalk形式のkanaとしてテキストを解釈する
  ///
  /// [enableInterrogativeUpspeak] 疑問文の調整を有効にする
  String tts(
    String text, {
    required int speakerId,
    required String outputPath,
    bool kana = false,
    bool enableInterrogativeUpspeak = true,
  }) {
    final Pointer<UintPtr> outputWavLengthPtr = calloc<UintPtr>();

    Pointer<Pointer<Uint8>> outputWavPtr = calloc<Pointer<Uint8>>();
    final option = voicevox_make_default_tts_options();
    option
      ..kana = kana
      ..enable_interrogative_upspeak = enableInterrogativeUpspeak;

    final textPtr = text.toNativeUtf8();
    final code = voicevox_tts(textPtr.cast<Char>(), speakerId, option,
        outputWavLengthPtr, outputWavPtr);

    if (code != VoicevoxResultCode.VOICEVOX_RESULT_OK) {
      throw Exception('VoicevoxResult: ${errorcodeToText(code)}');
    }
    final wavFile = File(outputPath);

    wavFile.writeAsBytesSync(
        outputWavPtr.value.asTypedList(outputWavLengthPtr.value));

    malloc.free(textPtr);
    calloc.free(outputWavLengthPtr);
    calloc.free(outputWavPtr);
    return outputPath;
  }

  /// モデルを読み込む
  ///
  /// [id] 読み込むモデルの話者ID
  void loadModel(int id) {
    final code = voicevox_load_model(id);
    if (code != VoicevoxResultCode.VOICEVOX_RESULT_OK) {
      throw Exception('VoicevoxResult: ${errorcodeToText(code)}');
    }
  }
}

/// VoicevoxCoreLibraryのエラーコードをテキストに変換する
String errorcodeToText(int code) {
  switch (code) {
    case 0:
      return '成功';
    case 1:
      return 'open_jtalk辞書ファイルが読み込まれていない';
    case 2:
      return 'modelの読み込みに失敗した';
    case 3:
      return 'サポートされているデバイス情報取得に失敗した';
    case 4:
      return 'GPUモードがサポートされていない';
    case 5:
      return 'メタ情報読み込みに失敗した';
    case 6:
      return 'ステータスが初期化されていない';
    case 7:
      return '無効なspeaker_idが指定された';
    case 8:
      return '無効なmodel_indexが指定された';
    case 9:
      return '推論に失敗した';
    case 10:
      return 'コンテキストラベル出力に失敗した';
    case 11:
      return '無効なutf8文字列が入力された';
    case 12:
      return 'aquestalk形式のテキストの解析に失敗した';
    case 13:
      return '無効なAudioQuery';
    default:
      return '不明なエラー';
  }
}
