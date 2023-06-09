// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint
import 'dart:ffi' as ffi;

class VoicevoxCoreLibrary {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  VoicevoxCoreLibrary(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  VoicevoxCoreLibrary.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  VoicevoxInitializeOptions voicevox_make_default_initialize_options() {
    return _voicevox_make_default_initialize_options();
  }

  late final _voicevox_make_default_initialize_optionsPtr =
      _lookup<ffi.NativeFunction<VoicevoxInitializeOptions Function()>>(
          'voicevox_make_default_initialize_options');
  late final _voicevox_make_default_initialize_options =
      _voicevox_make_default_initialize_optionsPtr
          .asFunction<VoicevoxInitializeOptions Function()>();

  int voicevox_initialize(
    VoicevoxInitializeOptions options,
  ) {
    return _voicevox_initialize(
      options,
    );
  }

  late final _voicevox_initializePtr = _lookup<
      ffi.NativeFunction<
          VoicevoxResultCode1 Function(
              VoicevoxInitializeOptions)>>('voicevox_initialize');
  late final _voicevox_initialize = _voicevox_initializePtr
      .asFunction<int Function(VoicevoxInitializeOptions)>();

  ffi.Pointer<ffi.Char> voicevox_get_version() {
    return _voicevox_get_version();
  }

  late final _voicevox_get_versionPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<ffi.Char> Function()>>(
          'voicevox_get_version');
  late final _voicevox_get_version =
      _voicevox_get_versionPtr.asFunction<ffi.Pointer<ffi.Char> Function()>();

  int voicevox_load_model(
    int speaker_id,
  ) {
    return _voicevox_load_model(
      speaker_id,
    );
  }

  late final _voicevox_load_modelPtr =
      _lookup<ffi.NativeFunction<VoicevoxResultCode1 Function(ffi.Uint32)>>(
          'voicevox_load_model');
  late final _voicevox_load_model =
      _voicevox_load_modelPtr.asFunction<int Function(int)>();

  bool voicevox_is_gpu_mode() {
    return _voicevox_is_gpu_mode();
  }

  late final _voicevox_is_gpu_modePtr =
      _lookup<ffi.NativeFunction<ffi.Bool Function()>>('voicevox_is_gpu_mode');
  late final _voicevox_is_gpu_mode =
      _voicevox_is_gpu_modePtr.asFunction<bool Function()>();

  bool voicevox_is_model_loaded(
    int speaker_id,
  ) {
    return _voicevox_is_model_loaded(
      speaker_id,
    );
  }

  late final _voicevox_is_model_loadedPtr =
      _lookup<ffi.NativeFunction<ffi.Bool Function(ffi.Uint32)>>(
          'voicevox_is_model_loaded');
  late final _voicevox_is_model_loaded =
      _voicevox_is_model_loadedPtr.asFunction<bool Function(int)>();

  void voicevox_finalize() {
    return _voicevox_finalize();
  }

  late final _voicevox_finalizePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>('voicevox_finalize');
  late final _voicevox_finalize =
      _voicevox_finalizePtr.asFunction<void Function()>();

  ffi.Pointer<ffi.Char> voicevox_get_metas_json() {
    return _voicevox_get_metas_json();
  }

  late final _voicevox_get_metas_jsonPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<ffi.Char> Function()>>(
          'voicevox_get_metas_json');
  late final _voicevox_get_metas_json = _voicevox_get_metas_jsonPtr
      .asFunction<ffi.Pointer<ffi.Char> Function()>();

  ffi.Pointer<ffi.Char> voicevox_get_supported_devices_json() {
    return _voicevox_get_supported_devices_json();
  }

  late final _voicevox_get_supported_devices_jsonPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<ffi.Char> Function()>>(
          'voicevox_get_supported_devices_json');
  late final _voicevox_get_supported_devices_json =
      _voicevox_get_supported_devices_jsonPtr
          .asFunction<ffi.Pointer<ffi.Char> Function()>();

  int voicevox_predict_duration(
    int length,
    ffi.Pointer<ffi.Int64> phoneme_vector,
    int speaker_id,
    ffi.Pointer<ffi.UintPtr> output_predict_duration_data_length,
    ffi.Pointer<ffi.Pointer<ffi.Float>> output_predict_duration_data,
  ) {
    return _voicevox_predict_duration(
      length,
      phoneme_vector,
      speaker_id,
      output_predict_duration_data_length,
      output_predict_duration_data,
    );
  }

  late final _voicevox_predict_durationPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.UintPtr,
                  ffi.Pointer<ffi.Int64>,
                  ffi.Uint32,
                  ffi.Pointer<ffi.UintPtr>,
                  ffi.Pointer<ffi.Pointer<ffi.Float>>)>>(
      'voicevox_predict_duration');
  late final _voicevox_predict_duration =
      _voicevox_predict_durationPtr.asFunction<
          int Function(int, ffi.Pointer<ffi.Int64>, int,
              ffi.Pointer<ffi.UintPtr>, ffi.Pointer<ffi.Pointer<ffi.Float>>)>();

  void voicevox_predict_duration_data_free(
    ffi.Pointer<ffi.Float> predict_duration_data,
  ) {
    return _voicevox_predict_duration_data_free(
      predict_duration_data,
    );
  }

  late final _voicevox_predict_duration_data_freePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Float>)>>(
          'voicevox_predict_duration_data_free');
  late final _voicevox_predict_duration_data_free =
      _voicevox_predict_duration_data_freePtr
          .asFunction<void Function(ffi.Pointer<ffi.Float>)>();

  int voicevox_predict_intonation(
    int length,
    ffi.Pointer<ffi.Int64> vowel_phoneme_vector,
    ffi.Pointer<ffi.Int64> consonant_phoneme_vector,
    ffi.Pointer<ffi.Int64> start_accent_vector,
    ffi.Pointer<ffi.Int64> end_accent_vector,
    ffi.Pointer<ffi.Int64> start_accent_phrase_vector,
    ffi.Pointer<ffi.Int64> end_accent_phrase_vector,
    int speaker_id,
    ffi.Pointer<ffi.UintPtr> output_predict_intonation_data_length,
    ffi.Pointer<ffi.Pointer<ffi.Float>> output_predict_intonation_data,
  ) {
    return _voicevox_predict_intonation(
      length,
      vowel_phoneme_vector,
      consonant_phoneme_vector,
      start_accent_vector,
      end_accent_vector,
      start_accent_phrase_vector,
      end_accent_phrase_vector,
      speaker_id,
      output_predict_intonation_data_length,
      output_predict_intonation_data,
    );
  }

  late final _voicevox_predict_intonationPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.UintPtr,
                  ffi.Pointer<ffi.Int64>,
                  ffi.Pointer<ffi.Int64>,
                  ffi.Pointer<ffi.Int64>,
                  ffi.Pointer<ffi.Int64>,
                  ffi.Pointer<ffi.Int64>,
                  ffi.Pointer<ffi.Int64>,
                  ffi.Uint32,
                  ffi.Pointer<ffi.UintPtr>,
                  ffi.Pointer<ffi.Pointer<ffi.Float>>)>>(
      'voicevox_predict_intonation');
  late final _voicevox_predict_intonation =
      _voicevox_predict_intonationPtr.asFunction<
          int Function(
              int,
              ffi.Pointer<ffi.Int64>,
              ffi.Pointer<ffi.Int64>,
              ffi.Pointer<ffi.Int64>,
              ffi.Pointer<ffi.Int64>,
              ffi.Pointer<ffi.Int64>,
              ffi.Pointer<ffi.Int64>,
              int,
              ffi.Pointer<ffi.UintPtr>,
              ffi.Pointer<ffi.Pointer<ffi.Float>>)>();

  void voicevox_predict_intonation_data_free(
    ffi.Pointer<ffi.Float> predict_intonation_data,
  ) {
    return _voicevox_predict_intonation_data_free(
      predict_intonation_data,
    );
  }

  late final _voicevox_predict_intonation_data_freePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Float>)>>(
          'voicevox_predict_intonation_data_free');
  late final _voicevox_predict_intonation_data_free =
      _voicevox_predict_intonation_data_freePtr
          .asFunction<void Function(ffi.Pointer<ffi.Float>)>();

  int voicevox_decode(
    int length,
    int phoneme_size,
    ffi.Pointer<ffi.Float> f0,
    ffi.Pointer<ffi.Float> phoneme_vector,
    int speaker_id,
    ffi.Pointer<ffi.UintPtr> output_decode_data_length,
    ffi.Pointer<ffi.Pointer<ffi.Float>> output_decode_data,
  ) {
    return _voicevox_decode(
      length,
      phoneme_size,
      f0,
      phoneme_vector,
      speaker_id,
      output_decode_data_length,
      output_decode_data,
    );
  }

  late final _voicevox_decodePtr = _lookup<
      ffi.NativeFunction<
          VoicevoxResultCode1 Function(
              ffi.UintPtr,
              ffi.UintPtr,
              ffi.Pointer<ffi.Float>,
              ffi.Pointer<ffi.Float>,
              ffi.Uint32,
              ffi.Pointer<ffi.UintPtr>,
              ffi.Pointer<ffi.Pointer<ffi.Float>>)>>('voicevox_decode');
  late final _voicevox_decode = _voicevox_decodePtr.asFunction<
      int Function(
          int,
          int,
          ffi.Pointer<ffi.Float>,
          ffi.Pointer<ffi.Float>,
          int,
          ffi.Pointer<ffi.UintPtr>,
          ffi.Pointer<ffi.Pointer<ffi.Float>>)>();

  void voicevox_decode_data_free(
    ffi.Pointer<ffi.Float> decode_data,
  ) {
    return _voicevox_decode_data_free(
      decode_data,
    );
  }

  late final _voicevox_decode_data_freePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Float>)>>(
          'voicevox_decode_data_free');
  late final _voicevox_decode_data_free = _voicevox_decode_data_freePtr
      .asFunction<void Function(ffi.Pointer<ffi.Float>)>();

  VoicevoxAudioQueryOptions voicevox_make_default_audio_query_options() {
    return _voicevox_make_default_audio_query_options();
  }

  late final _voicevox_make_default_audio_query_optionsPtr =
      _lookup<ffi.NativeFunction<VoicevoxAudioQueryOptions Function()>>(
          'voicevox_make_default_audio_query_options');
  late final _voicevox_make_default_audio_query_options =
      _voicevox_make_default_audio_query_optionsPtr
          .asFunction<VoicevoxAudioQueryOptions Function()>();

  int voicevox_audio_query(
    ffi.Pointer<ffi.Char> text,
    int speaker_id,
    VoicevoxAudioQueryOptions options,
    ffi.Pointer<ffi.Pointer<ffi.Char>> output_audio_query_json,
  ) {
    return _voicevox_audio_query(
      text,
      speaker_id,
      options,
      output_audio_query_json,
    );
  }

  late final _voicevox_audio_queryPtr = _lookup<
      ffi.NativeFunction<
          VoicevoxResultCode1 Function(
              ffi.Pointer<ffi.Char>,
              ffi.Uint32,
              VoicevoxAudioQueryOptions,
              ffi.Pointer<ffi.Pointer<ffi.Char>>)>>('voicevox_audio_query');
  late final _voicevox_audio_query = _voicevox_audio_queryPtr.asFunction<
      int Function(ffi.Pointer<ffi.Char>, int, VoicevoxAudioQueryOptions,
          ffi.Pointer<ffi.Pointer<ffi.Char>>)>();

  VoicevoxSynthesisOptions voicevox_make_default_synthesis_options() {
    return _voicevox_make_default_synthesis_options();
  }

  late final _voicevox_make_default_synthesis_optionsPtr =
      _lookup<ffi.NativeFunction<VoicevoxSynthesisOptions Function()>>(
          'voicevox_make_default_synthesis_options');
  late final _voicevox_make_default_synthesis_options =
      _voicevox_make_default_synthesis_optionsPtr
          .asFunction<VoicevoxSynthesisOptions Function()>();

  int voicevox_synthesis(
    ffi.Pointer<ffi.Char> audio_query_json,
    int speaker_id,
    VoicevoxSynthesisOptions options,
    ffi.Pointer<ffi.UintPtr> output_wav_length,
    ffi.Pointer<ffi.Pointer<ffi.Uint8>> output_wav,
  ) {
    return _voicevox_synthesis(
      audio_query_json,
      speaker_id,
      options,
      output_wav_length,
      output_wav,
    );
  }

  late final _voicevox_synthesisPtr = _lookup<
      ffi.NativeFunction<
          VoicevoxResultCode1 Function(
              ffi.Pointer<ffi.Char>,
              ffi.Uint32,
              VoicevoxSynthesisOptions,
              ffi.Pointer<ffi.UintPtr>,
              ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>>('voicevox_synthesis');
  late final _voicevox_synthesis = _voicevox_synthesisPtr.asFunction<
      int Function(ffi.Pointer<ffi.Char>, int, VoicevoxSynthesisOptions,
          ffi.Pointer<ffi.UintPtr>, ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>();

  VoicevoxTtsOptions voicevox_make_default_tts_options() {
    return _voicevox_make_default_tts_options();
  }

  late final _voicevox_make_default_tts_optionsPtr =
      _lookup<ffi.NativeFunction<VoicevoxTtsOptions Function()>>(
          'voicevox_make_default_tts_options');
  late final _voicevox_make_default_tts_options =
      _voicevox_make_default_tts_optionsPtr
          .asFunction<VoicevoxTtsOptions Function()>();

  int voicevox_tts(
    ffi.Pointer<ffi.Char> text,
    int speaker_id,
    VoicevoxTtsOptions options,
    ffi.Pointer<ffi.UintPtr> output_wav_length,
    ffi.Pointer<ffi.Pointer<ffi.Uint8>> output_wav,
  ) {
    return _voicevox_tts(
      text,
      speaker_id,
      options,
      output_wav_length,
      output_wav,
    );
  }

  late final _voicevox_ttsPtr = _lookup<
      ffi.NativeFunction<
          VoicevoxResultCode1 Function(
              ffi.Pointer<ffi.Char>,
              ffi.Uint32,
              VoicevoxTtsOptions,
              ffi.Pointer<ffi.UintPtr>,
              ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>>('voicevox_tts');
  late final _voicevox_tts = _voicevox_ttsPtr.asFunction<
      int Function(ffi.Pointer<ffi.Char>, int, VoicevoxTtsOptions,
          ffi.Pointer<ffi.UintPtr>, ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>();

  void voicevox_audio_query_json_free(
    ffi.Pointer<ffi.Char> audio_query_json,
  ) {
    return _voicevox_audio_query_json_free(
      audio_query_json,
    );
  }

  late final _voicevox_audio_query_json_freePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Char>)>>(
          'voicevox_audio_query_json_free');
  late final _voicevox_audio_query_json_free =
      _voicevox_audio_query_json_freePtr
          .asFunction<void Function(ffi.Pointer<ffi.Char>)>();

  void voicevox_wav_free(
    ffi.Pointer<ffi.Uint8> wav,
  ) {
    return _voicevox_wav_free(
      wav,
    );
  }

  late final _voicevox_wav_freePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Uint8>)>>(
          'voicevox_wav_free');
  late final _voicevox_wav_free =
      _voicevox_wav_freePtr.asFunction<void Function(ffi.Pointer<ffi.Uint8>)>();

  ffi.Pointer<ffi.Char> voicevox_error_result_to_message(
    int result_code,
  ) {
    return _voicevox_error_result_to_message(
      result_code,
    );
  }

  late final _voicevox_error_result_to_messagePtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Char> Function(
              VoicevoxResultCode1)>>('voicevox_error_result_to_message');
  late final _voicevox_error_result_to_message =
      _voicevox_error_result_to_messagePtr
          .asFunction<ffi.Pointer<ffi.Char> Function(int)>();
}

/// ハードウェアアクセラレーションモードを設定する設定値
abstract class VoicevoxAccelerationMode {
  /// 実行環境に合った適切なハードウェアアクセラレーションモードを選択する
  static const int VOICEVOX_ACCELERATION_MODE_AUTO = 0;

  /// ハードウェアアクセラレーションモードを"CPU"に設定する
  static const int VOICEVOX_ACCELERATION_MODE_CPU = 1;

  /// ハードウェアアクセラレーションモードを"GPU"に設定する
  static const int VOICEVOX_ACCELERATION_MODE_GPU = 2;
}

/// 処理結果を示す結果コード
abstract class VoicevoxResultCode {
  /// 成功
  static const int VOICEVOX_RESULT_OK = 0;

  /// open_jtalk辞書ファイルが読み込まれていない
  static const int VOICEVOX_RESULT_NOT_LOADED_OPENJTALK_DICT_ERROR = 1;

  /// modelの読み込みに失敗した
  static const int VOICEVOX_RESULT_LOAD_MODEL_ERROR = 2;

  /// サポートされているデバイス情報取得に失敗した
  static const int VOICEVOX_RESULT_GET_SUPPORTED_DEVICES_ERROR = 3;

  /// GPUモードがサポートされていない
  static const int VOICEVOX_RESULT_GPU_SUPPORT_ERROR = 4;

  /// メタ情報読み込みに失敗した
  static const int VOICEVOX_RESULT_LOAD_METAS_ERROR = 5;

  /// ステータスが初期化されていない
  static const int VOICEVOX_RESULT_UNINITIALIZED_STATUS_ERROR = 6;

  /// 無効なspeaker_idが指定された
  static const int VOICEVOX_RESULT_INVALID_SPEAKER_ID_ERROR = 7;

  /// 無効なmodel_indexが指定された
  static const int VOICEVOX_RESULT_INVALID_MODEL_INDEX_ERROR = 8;

  /// 推論に失敗した
  static const int VOICEVOX_RESULT_INFERENCE_ERROR = 9;

  /// コンテキストラベル出力に失敗した
  static const int VOICEVOX_RESULT_EXTRACT_FULL_CONTEXT_LABEL_ERROR = 10;

  /// 無効なutf8文字列が入力された
  static const int VOICEVOX_RESULT_INVALID_UTF8_INPUT_ERROR = 11;

  /// aquestalk形式のテキストの解析に失敗した
  static const int VOICEVOX_RESULT_PARSE_KANA_ERROR = 12;

  /// 無効なAudioQuery
  static const int VOICEVOX_RESULT_INVALID_AUDIO_QUERY_ERROR = 13;
}

/// 初期化オプション
class VoicevoxInitializeOptions extends ffi.Struct {
  /// ハードウェアアクセラレーションモード
  @VoicevoxAccelerationMode1()
  external int acceleration_mode;

  /// CPU利用数を指定
  /// 0を指定すると環境に合わせたCPUが利用される
  @ffi.Uint16()
  external int cpu_num_threads;

  /// 全てのモデルを読み込む
  @ffi.Bool()
  external bool load_all_models;

  /// open_jtalkの辞書ディレクトリ
  external ffi.Pointer<ffi.Char> open_jtalk_dict_dir;
}

typedef VoicevoxAccelerationMode1 = ffi.Int32;

/// Audio query のオプション
class VoicevoxAudioQueryOptions extends ffi.Struct {
  /// aquestalk形式のkanaとしてテキストを解釈する
  @ffi.Bool()
  external bool kana;
}

/// `voicevox_synthesis` のオプション
class VoicevoxSynthesisOptions extends ffi.Struct {
  /// 疑問文の調整を有効にする
  @ffi.Bool()
  external bool enable_interrogative_upspeak;
}

/// テキスト音声合成オプション
class VoicevoxTtsOptions extends ffi.Struct {
  /// aquestalk形式のkanaとしてテキストを解釈する
  @ffi.Bool()
  external bool kana;

  /// 疑問文の調整を有効にする
  @ffi.Bool()
  external bool enable_interrogative_upspeak;
}

typedef VoicevoxResultCode1 = ffi.Int32;
