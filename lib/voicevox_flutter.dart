import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

import 'voicevox_flutter_platform_interface.dart';

class VoicevoxFlutter {
  static final VoicevoxFlutter instance = VoicevoxFlutter._();
  VoicevoxFlutter._();
  late DynamicLibrary nativeVoicevoxLib;
  Future<void> initialize(
      {required String modelPath,
      required String openJdkDicPath,
      int? cpuNumThreads,
      bool loadAllModels = true}) async {
    await VoicevoxFlutterPlatform.instance.setModelPath(modelPath);
    nativeVoicevoxLib = DynamicLibrary.open('libvoicevox_core.so');
    final option = nativeVoicevoxLib.lookupFunction<
        VoicevoxInitializeOptions Function(),
        VoicevoxInitializeOptions
            Function()>("voicevox_make_default_initialize_options")();

    option
      ..acceleration_mode =
          VoicevoxAccelerationMode.VOICEVOX_ACCELERATION_MODE_CPU.index
      ..cpu_num_threads = cpuNumThreads ?? 0
      ..load_all_models = loadAllModels
      ..open_jtalk_dict_dir = openJdkDicPath.toNativeUtf8();
    final res = nativeVoicevoxLib.lookupFunction<
        Int32 Function(VoicevoxInitializeOptions),
        int Function(VoicevoxInitializeOptions)>("voicevox_initialize")(option);
    if (VoicevoxResultCode.values[res] !=
        VoicevoxResultCode.VOICEVOX_RESULT_OK) {
      throw Exception(VoicevoxResultCode.values[res]);
    }
  }

  Future<String> audioQuery(String text) async {
    final defaultQueryOption = nativeVoicevoxLib.lookupFunction<
        VoicevoxAudioQueryOptions Function(),
        VoicevoxAudioQueryOptions
            Function()>("voicevox_make_default_audio_query_options")();
    defaultQueryOption.kana = false;
    Pointer<Pointer<Utf8>> output = calloc<Pointer<Utf8>>();
    final res = nativeVoicevoxLib.lookupFunction<
        Int32 Function(Pointer<Utf8>, Uint32, VoicevoxAudioQueryOptions,
            Pointer<Pointer<Utf8>>),
        int Function(Pointer<Utf8>, int, VoicevoxAudioQueryOptions,
            Pointer<Pointer<Utf8>>)>("voicevox_audio_query")(
      text.toNativeUtf8(),
      0,
      defaultQueryOption,
      output,
    );
    if (VoicevoxResultCode.values[res] !=
        VoicevoxResultCode.VOICEVOX_RESULT_OK) {
      throw Exception(VoicevoxResultCode.values[res]);
    }
    return output.value.toDartString();
  }

  Future<void> synthesis(String query, String outputPath) async {
    final synthesisOptions = nativeVoicevoxLib.lookupFunction<
        VoicevoxSynthesisOptions Function(),
        VoicevoxSynthesisOptions
            Function()>("voicevox_make_default_synthesis_options")();
    synthesisOptions.enable_interrogative_upspeak = true;
    final Pointer<Uint32> output_wav_length = calloc<Uint32>();

    Pointer<Pointer<Utf8>> output_wav = calloc<Pointer<Utf8>>();
    final res = nativeVoicevoxLib.lookupFunction<
        Int32 Function(Pointer<Utf8>, Uint32, VoicevoxSynthesisOptions,
            Pointer<Uint32>, Pointer<Pointer<Utf8>>),
        int Function(Pointer<Utf8>, int, VoicevoxSynthesisOptions,
            Pointer<Uint32>, Pointer<Pointer<Utf8>>)>("voicevox_synthesis")(
      query.toNativeUtf8(),
      0,
      synthesisOptions,
      output_wav_length,
      output_wav,
    );

    final wavFile = File(outputPath);

    wavFile.writeAsBytesSync(
        output_wav.value.cast<Uint8>().asTypedList(output_wav_length.value));

    calloc.free(output_wav_length);
    calloc.free(output_wav);
    if (VoicevoxResultCode.values[res] !=
        VoicevoxResultCode.VOICEVOX_RESULT_OK) {
      throw Exception(VoicevoxResultCode.values[res]);
    }
  }
}

enum VoicevoxAccelerationMode {
  VOICEVOX_ACCELERATION_MODE_AUTO,
  VOICEVOX_ACCELERATION_MODE_CPU,
  VOICEVOX_ACCELERATION_MODE_GPU,
}

class VoicevoxInitializeOptions extends Struct {
  @Int32()
  external int acceleration_mode;

  @Uint16()
  external int cpu_num_threads;

  @Bool()
  external bool load_all_models;

  external Pointer<Utf8> open_jtalk_dict_dir;
}

class VoicevoxAudioQueryOptions extends Struct {
  @Bool()
  external bool kana;
}

enum VoicevoxResultCode {
  /// 成功
  VOICEVOX_RESULT_OK,

  /// open_jtalk辞書ファイルが読み込まれていない
  VOICEVOX_RESULT_NOT_LOADED_OPENJTALK_DICT_ERROR,

  /// modelの読み込みに失敗した
  VOICEVOX_RESULT_LOAD_MODEL_ERROR,

  /// サポートされているデバイス情報取得に失敗した
  VOICEVOX_RESULT_GET_SUPPORTED_DEVICES_ERROR,

  /// GPUモードがサポートされていない
  VOICEVOX_RESULT_GPU_SUPPORT_ERROR,

  /// メタ情報読み込みに失敗した
  VOICEVOX_RESULT_LOAD_METAS_ERROR,

  /// ステータスが初期化されていない
  VOICEVOX_RESULT_UNINITIALIZED_STATUS_ERROR,

  /// 無効なspeaker_idが指定された
  VOICEVOX_RESULT_INVALID_SPEAKER_ID_ERROR,

  /// 無効なmodel_indexが指定された
  VOICEVOX_RESULT_INVALID_MODEL_INDEX_ERROR,

  /// 推論に失敗した
  VOICEVOX_RESULT_INFERENCE_ERROR,

  /// コンテキストラベル出力に失敗した
  VOICEVOX_RESULT_EXTRACT_FULL_CONTEXT_LABEL_ERROR,

  /// 無効なutf8文字列が入力された
  VOICEVOX_RESULT_INVALID_UTF8_INPUT_ERROR,

  /// aquestalk形式のテキストの解析に失敗した
  VOICEVOX_RESULT_PARSE_KANA_ERROR,

  /// 無効なAudioQuery
  VOICEVOX_RESULT_INVALID_AUDIO_QUERY_ERROR,
}

class VoicevoxSynthesisOptions extends Struct {
  @Bool()
  external bool enable_interrogative_upspeak;
}
