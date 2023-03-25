// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:ffi';

import 'package:ffi/ffi.dart';

mixin VoicevoxCoreBinding {
  late DynamicLibrary nativeVoicevoxLib;
  VoicevoxInitializeOptions voicevox_make_default_initialize_options() =>
      nativeVoicevoxLib.lookupFunction<
          VoicevoxInitializeOptions Function(),
          VoicevoxInitializeOptions
              Function()>("voicevox_make_default_initialize_options")();

  VoicevoxResultCode voicevox_initialize(VoicevoxInitializeOptions options) =>
      nativeVoicevoxLib
          .lookupFunction<Int32 Function(VoicevoxInitializeOptions),
              int Function(VoicevoxInitializeOptions)>("voicevox_initialize")
          (options)
          .toVoicevoxResultCode();

  VoicevoxAudioQueryOptions voicevox_make_default_audio_query_options() =>
      nativeVoicevoxLib.lookupFunction<
          VoicevoxAudioQueryOptions Function(),
          VoicevoxAudioQueryOptions
              Function()>("voicevox_make_default_audio_query_options")();
}

/// ハードウェアアクセラレーションモードを設定する設定値
enum VoicevoxAccelerationMode {
  /// 実行環境に合った適切なハードウェアアクセラレーションモードを選択する
  VOICEVOX_ACCELERATION_MODE_AUTO,

  /// ハードウェアアクセラレーションモードを"CPU"に設定する
  VOICEVOX_ACCELERATION_MODE_CPU,

  /// ハードウェアアクセラレーションモードを"GPU"に設定する
  VOICEVOX_ACCELERATION_MODE_GPU,
}

/// 初期化オプション
class VoicevoxInitializeOptions extends Struct {
  /// ハードウェアアクセラレーションモード
  @Int32()
  external int acceleration_mode;

  /// CPU利用数を指定
  /// 0を指定すると環境に合わせたCPUが利用される
  @Uint16()
  external int cpu_num_threads;

  /// 全てのモデルを読み込む
  @Bool()
  external bool load_all_models;

  /// open_jtalkの辞書ディレクトリ
  external Pointer<Utf8> open_jtalk_dict_dir;
}

/// Audio query のオプション
class VoicevoxAudioQueryOptions extends Struct {
  /// aquestalk形式のkanaとしてテキストを解釈する
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

extension IntExt on int {
  /// 整数値を`VoicevoxResultCode`に変換する
  VoicevoxResultCode toVoicevoxResultCode() => VoicevoxResultCode.values[this];
}

/// `voicevox_synthesis` のオプション
class VoicevoxSynthesisOptions extends Struct {
  /// 疑問文の調整を有効にする
  @Bool()
  external bool enable_interrogative_upspeak;
}
