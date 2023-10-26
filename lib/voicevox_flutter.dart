import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

import 'generated_bindings.dart';

/// VoicevoxCoreLibraryのラッパークラス
class VoicevoxFlutter extends VoicevoxCoreLibrary {
  static final VoicevoxFlutter instance = VoicevoxFlutter._(
    Platform.isAndroid
        ? DynamicLibrary.open('libvoicevox_core.so')
        : DynamicLibrary.open('libvoicevox_core.dylib'),
  );
  VoicevoxFlutter._(super.dynamicLibrary);

  /// VoicevoxSynthesizerのポインタ
  late Pointer<VoicevoxSynthesizer> _synthesizerPtr;

  /// 読み込まれたモデルのポインタのリスト
  final _loadedModelPtrList = <Pointer<VoicevoxVoiceModel>>[];

  /// VoicevocFlutterを初期化する
  ///
  /// [openJdkDictPath] OpenJtalkの辞書ファイルのパス
  ///
  /// [cpuNumThreads] CPUスレッド数
  Future<void> initialize({
    required String openJdkDictPath,
    int? cpuNumThreads,
  }) async {
    final openJdkDictPathPtr = openJdkDictPath.toNativeUtf8();
    final openJtalkPtrPtr = malloc<Pointer<OpenJtalkRc>>();
    final outputSynthesizerPtrPtr = malloc<Pointer<VoicevoxSynthesizer>>();
    try {
      final options = voicevox_make_default_initialize_options();

      var code = voicevox_open_jtalk_rc_new(
          openJdkDictPathPtr.cast<Char>(), openJtalkPtrPtr);
      if (code != VoicevoxResultCode.VOICEVOX_RESULT_OK) {
        throw Exception('VoicevoxResult: ${errorcodeToText(code)}');
      }

      options
        ..acceleration_mode =
            VoicevoxAccelerationMode.VOICEVOX_ACCELERATION_MODE_CPU
        ..cpu_num_threads = cpuNumThreads ?? 0;

      code = voicevox_synthesizer_new_with_initialize(
        openJtalkPtrPtr.value,
        options,
        outputSynthesizerPtrPtr,
      );
      _synthesizerPtr = outputSynthesizerPtrPtr.value;

      if (code != VoicevoxResultCode.VOICEVOX_RESULT_OK) {
        throw Exception('VoicevoxResult: ${errorcodeToText(code)}');
      }
    } catch (_) {
      rethrow;
    } finally {
      calloc.free(openJdkDictPathPtr);
      malloc
        ..free(openJtalkPtrPtr)
        ..free(outputSynthesizerPtrPtr);
    }
  }

  /// モデルを読み込む
  ///
  /// [modelPath] vvmファイルのパス
  void loadVoiceModel(String modelPath) {
    final modelPtrPtr = malloc<Pointer<VoicevoxVoiceModel>>();
    final modelPathPtr = modelPath.toNativeUtf8();
    try {
      var code = voicevox_voice_model_new_from_path(
        modelPathPtr.cast<Char>(),
        modelPtrPtr,
      );
      if (code != VoicevoxResultCode.VOICEVOX_RESULT_OK) {
        throw Exception('VoicevoxResult: ${errorcodeToText(code)}');
      }
      code = voicevox_synthesizer_load_voice_model(
        _synthesizerPtr,
        modelPtrPtr.value,
      );

      if (code != VoicevoxResultCode.VOICEVOX_RESULT_OK) {
        throw Exception('VoicevoxResult: ${errorcodeToText(code)}');
      }
      _loadedModelPtrList.add(modelPtrPtr.value);
    } finally {
      calloc.free(modelPathPtr);
      malloc.free(modelPtrPtr);
    }
  }

  /// AudioQuery を実行する
  ///
  /// [text] テキスト
  ///
  /// [styleId] スタイルID
  ///
  /// [kana] aquestalk形式のkanaとしてテキストを解釈する
  String audioQuery(
    String text, {
    required int styleId,
    bool kana = false,
  }) {
    final textPtr = text.toNativeUtf8();
    Pointer<Pointer<Char>> outputPtr = malloc<Pointer<Char>>();
    try {
      late int code;
      if (kana) {
        code = voicevox_synthesizer_create_audio_query_from_kana(
          _synthesizerPtr,
          textPtr.cast<Char>(),
          styleId,
          outputPtr,
        );
      } else {
        code = voicevox_synthesizer_create_audio_query(
          _synthesizerPtr,
          textPtr.cast<Char>(),
          styleId,
          outputPtr,
        );
      }

      if (code != VoicevoxResultCode.VOICEVOX_RESULT_OK) {
        throw Exception('VoicevoxResult: ${errorcodeToText(code)}');
      }
      final query = outputPtr.value.cast<Utf8>().toDartString();
      return query;
    } catch (_) {
      rethrow;
    } finally {
      calloc.free(textPtr);
      malloc.free(outputPtr);
    }
  }

  /// AudioQuery から音声合成する
  ///
  /// [query] jsonフォーマットされた AudioQuery
  ///
  /// [styleId] スタイルID
  ///
  /// [outputPath] 出力ファイルパス
  void synthesis(
    String query, {
    required int styleId,
    required String outputPath,
    bool enableInterrogativeUpspeak = true,
  }) {
    final outputWavLengthPtr = malloc<UintPtr>();
    final outputWavPtr = malloc<Pointer<Uint8>>();
    try {
      final synthesisOptions = voicevox_make_default_synthesis_options();
      synthesisOptions.enable_interrogative_upspeak =
          enableInterrogativeUpspeak;

      final queryPtr = query.toNativeUtf8();
      final code = voicevox_synthesizer_synthesis(
        _synthesizerPtr,
        queryPtr.cast<Char>(),
        styleId,
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
    } catch (_) {
      rethrow;
    } finally {
      malloc
        ..free(outputWavLengthPtr)
        ..free(outputWavPtr);
    }
  }

  /// テキスト音声合成を実行する
  ///
  /// [text] テキスト
  ///
  /// [styleId] スタイルID
  ///
  /// [outputPath] 出力ファイルパス
  ///
  /// [kana] aquestalk形式のkanaとしてテキストを解釈する
  ///
  /// [enableInterrogativeUpspeak] 疑問文の調整を有効にする
  String tts(
    String text, {
    required int styleId,
    required String outputPath,
    bool kana = false,
    bool enableInterrogativeUpspeak = true,
  }) {
    final outputWavLengthPtr = malloc<UintPtr>();
    final outputWavPtr = malloc<Pointer<Uint8>>();
    final textPtr = text.toNativeUtf8();
    try {
      final option = voicevox_make_default_tts_options();
      option.enable_interrogative_upspeak = enableInterrogativeUpspeak;
      late int code;
      if (kana) {
        code = voicevox_synthesizer_tts_from_kana(
          _synthesizerPtr,
          textPtr.cast<Char>(),
          styleId,
          option,
          outputWavLengthPtr,
          outputWavPtr,
        );
      } else {
        code = voicevox_synthesizer_tts(
          _synthesizerPtr,
          textPtr.cast<Char>(),
          styleId,
          option,
          outputWavLengthPtr,
          outputWavPtr,
        );
      }
      if (code != VoicevoxResultCode.VOICEVOX_RESULT_OK) {
        throw Exception('VoicevoxResult: ${errorcodeToText(code)}');
      }
      final wavFile = File(outputPath);

      wavFile.writeAsBytesSync(
          outputWavPtr.value.asTypedList(outputWavLengthPtr.value));

      malloc.free(textPtr);
      malloc.free(outputWavLengthPtr);
      malloc.free(outputWavPtr);
      return outputPath;
    } catch (_) {
      rethrow;
    } finally {
      malloc
        ..free(outputWavLengthPtr)
        ..free(outputWavPtr);
      calloc.free(textPtr);
    }
  }

  void dispose() {
    for (final modelPtr in _loadedModelPtrList) {
      voicevox_voice_model_delete(modelPtr);
    }
    voicevox_synthesizer_delete(_synthesizerPtr);
  }
}

/// VoicevoxCoreLibraryのエラーコードをテキストに変換する
String errorcodeToText(int code) {
  switch (code) {
    case 0:
      return '成功';
    case 1:
      return 'open_jtalk辞書ファイルが読み込まれていない';
    case 3:
      return 'サポートされているデバイス情報取得に失敗した';
    case 4:
      return 'GPUモードがサポートされていない';
    case 6:
      return 'スタイルIDに対するスタイルが見つからなかった';
    case 7:
      return '音声モデルIDに対する音声モデルが見つからなかった';
    case 8:
      return '推論に失敗した';
    case 11:
      return 'コンテキストラベル出力に失敗した';
    case 12:
      return '無効なutf8文字列が入力された';
    case 13:
      return 'AquesTalk風記法のテキストの解析に失敗した';
    case 14:
      return '無効なAudioQuery';
    case 15:
      return '無効なAccentPhrase';
    case 16:
      return 'ZIPファイルを開くことに失敗した';
    case 17:
      return 'ZIP内のファイルが読めなかった';
    case 18:
      return 'すでに読み込まれている音声モデルを読み込もうとした';
    case 26:
      return 'すでに読み込まれているスタイルを読み込もうとした';
    case 27:
      return '無効なモデルデータ';
    case 20:
      return 'ユーザー辞書を読み込めなかった';
    case 21:
      return 'ユーザー辞書を書き込めなかった';
    case 22:
      return 'ユーザー辞書に単語が見つからなかった';
    case 23:
      return 'OpenJTalkのユーザー辞書の設定に失敗した';
    case 24:
      return 'ユーザー辞書の単語のバリデーションに失敗した';
    case 25:
      return 'UUIDの変換に失敗した';
    default:
      return '不明なエラー';
  }
}
