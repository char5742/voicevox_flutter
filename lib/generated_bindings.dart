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

  int voicevox_open_jtalk_rc_new(
    ffi.Pointer<ffi.Char> open_jtalk_dic_dir,
    ffi.Pointer<ffi.Pointer<OpenJtalkRc>> out_open_jtalk,
  ) {
    return _voicevox_open_jtalk_rc_new(
      open_jtalk_dic_dir,
      out_open_jtalk,
    );
  }

  late final _voicevox_open_jtalk_rc_newPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(ffi.Pointer<ffi.Char>,
                  ffi.Pointer<ffi.Pointer<OpenJtalkRc>>)>>(
      'voicevox_open_jtalk_rc_new');
  late final _voicevox_open_jtalk_rc_new =
      _voicevox_open_jtalk_rc_newPtr.asFunction<
          int Function(
              ffi.Pointer<ffi.Char>, ffi.Pointer<ffi.Pointer<OpenJtalkRc>>)>();

  int voicevox_open_jtalk_rc_use_user_dict(
    ffi.Pointer<OpenJtalkRc> open_jtalk,
    ffi.Pointer<VoicevoxUserDict> user_dict,
  ) {
    return _voicevox_open_jtalk_rc_use_user_dict(
      open_jtalk,
      user_dict,
    );
  }

  late final _voicevox_open_jtalk_rc_use_user_dictPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<OpenJtalkRc>, ffi.Pointer<VoicevoxUserDict>)>>(
      'voicevox_open_jtalk_rc_use_user_dict');
  late final _voicevox_open_jtalk_rc_use_user_dict =
      _voicevox_open_jtalk_rc_use_user_dictPtr.asFunction<
          int Function(
              ffi.Pointer<OpenJtalkRc>, ffi.Pointer<VoicevoxUserDict>)>();

  void voicevox_open_jtalk_rc_delete(
    ffi.Pointer<OpenJtalkRc> open_jtalk,
  ) {
    return _voicevox_open_jtalk_rc_delete(
      open_jtalk,
    );
  }

  late final _voicevox_open_jtalk_rc_deletePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<OpenJtalkRc>)>>(
          'voicevox_open_jtalk_rc_delete');
  late final _voicevox_open_jtalk_rc_delete = _voicevox_open_jtalk_rc_deletePtr
      .asFunction<void Function(ffi.Pointer<OpenJtalkRc>)>();

  VoicevoxInitializeOptions voicevox_make_default_initialize_options() {
    return _voicevox_make_default_initialize_options();
  }

  late final _voicevox_make_default_initialize_optionsPtr =
      _lookup<ffi.NativeFunction<VoicevoxInitializeOptions Function()>>(
          'voicevox_make_default_initialize_options');
  late final _voicevox_make_default_initialize_options =
      _voicevox_make_default_initialize_optionsPtr
          .asFunction<VoicevoxInitializeOptions Function()>();

  ffi.Pointer<ffi.Char> voicevox_get_version() {
    return _voicevox_get_version();
  }

  late final _voicevox_get_versionPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<ffi.Char> Function()>>(
          'voicevox_get_version');
  late final _voicevox_get_version =
      _voicevox_get_versionPtr.asFunction<ffi.Pointer<ffi.Char> Function()>();

  int voicevox_voice_model_new_from_path(
    ffi.Pointer<ffi.Char> path,
    ffi.Pointer<ffi.Pointer<VoicevoxVoiceModel>> out_model,
  ) {
    return _voicevox_voice_model_new_from_path(
      path,
      out_model,
    );
  }

  late final _voicevox_voice_model_new_from_pathPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(ffi.Pointer<ffi.Char>,
                  ffi.Pointer<ffi.Pointer<VoicevoxVoiceModel>>)>>(
      'voicevox_voice_model_new_from_path');
  late final _voicevox_voice_model_new_from_path =
      _voicevox_voice_model_new_from_pathPtr.asFunction<
          int Function(ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Pointer<VoicevoxVoiceModel>>)>();

  VoicevoxVoiceModelId voicevox_voice_model_id(
    ffi.Pointer<VoicevoxVoiceModel> model,
  ) {
    return _voicevox_voice_model_id(
      model,
    );
  }

  late final _voicevox_voice_model_idPtr = _lookup<
      ffi.NativeFunction<
          VoicevoxVoiceModelId Function(
              ffi.Pointer<VoicevoxVoiceModel>)>>('voicevox_voice_model_id');
  late final _voicevox_voice_model_id = _voicevox_voice_model_idPtr.asFunction<
      VoicevoxVoiceModelId Function(ffi.Pointer<VoicevoxVoiceModel>)>();

  ffi.Pointer<ffi.Char> voicevox_voice_model_get_metas_json(
    ffi.Pointer<VoicevoxVoiceModel> model,
  ) {
    return _voicevox_voice_model_get_metas_json(
      model,
    );
  }

  late final _voicevox_voice_model_get_metas_jsonPtr = _lookup<
          ffi.NativeFunction<
              ffi.Pointer<ffi.Char> Function(ffi.Pointer<VoicevoxVoiceModel>)>>(
      'voicevox_voice_model_get_metas_json');
  late final _voicevox_voice_model_get_metas_json =
      _voicevox_voice_model_get_metas_jsonPtr.asFunction<
          ffi.Pointer<ffi.Char> Function(ffi.Pointer<VoicevoxVoiceModel>)>();

  void voicevox_voice_model_delete(
    ffi.Pointer<VoicevoxVoiceModel> model,
  ) {
    return _voicevox_voice_model_delete(
      model,
    );
  }

  late final _voicevox_voice_model_deletePtr = _lookup<
          ffi
          .NativeFunction<ffi.Void Function(ffi.Pointer<VoicevoxVoiceModel>)>>(
      'voicevox_voice_model_delete');
  late final _voicevox_voice_model_delete = _voicevox_voice_model_deletePtr
      .asFunction<void Function(ffi.Pointer<VoicevoxVoiceModel>)>();

  int voicevox_synthesizer_new_with_initialize(
    ffi.Pointer<OpenJtalkRc> open_jtalk,
    VoicevoxInitializeOptions options,
    ffi.Pointer<ffi.Pointer<VoicevoxSynthesizer>> out_synthesizer,
  ) {
    return _voicevox_synthesizer_new_with_initialize(
      open_jtalk,
      options,
      out_synthesizer,
    );
  }

  late final _voicevox_synthesizer_new_with_initializePtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<OpenJtalkRc>,
                  VoicevoxInitializeOptions,
                  ffi.Pointer<ffi.Pointer<VoicevoxSynthesizer>>)>>(
      'voicevox_synthesizer_new_with_initialize');
  late final _voicevox_synthesizer_new_with_initialize =
      _voicevox_synthesizer_new_with_initializePtr.asFunction<
          int Function(ffi.Pointer<OpenJtalkRc>, VoicevoxInitializeOptions,
              ffi.Pointer<ffi.Pointer<VoicevoxSynthesizer>>)>();

  void voicevox_synthesizer_delete(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
  ) {
    return _voicevox_synthesizer_delete(
      synthesizer,
    );
  }

  late final _voicevox_synthesizer_deletePtr = _lookup<
          ffi
          .NativeFunction<ffi.Void Function(ffi.Pointer<VoicevoxSynthesizer>)>>(
      'voicevox_synthesizer_delete');
  late final _voicevox_synthesizer_delete = _voicevox_synthesizer_deletePtr
      .asFunction<void Function(ffi.Pointer<VoicevoxSynthesizer>)>();

  int voicevox_synthesizer_load_voice_model(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
    ffi.Pointer<VoicevoxVoiceModel> model,
  ) {
    return _voicevox_synthesizer_load_voice_model(
      synthesizer,
      model,
    );
  }

  late final _voicevox_synthesizer_load_voice_modelPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(ffi.Pointer<VoicevoxSynthesizer>,
                  ffi.Pointer<VoicevoxVoiceModel>)>>(
      'voicevox_synthesizer_load_voice_model');
  late final _voicevox_synthesizer_load_voice_model =
      _voicevox_synthesizer_load_voice_modelPtr.asFunction<
          int Function(ffi.Pointer<VoicevoxSynthesizer>,
              ffi.Pointer<VoicevoxVoiceModel>)>();

  int voicevox_synthesizer_unload_voice_model(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
    VoicevoxVoiceModelId model_id,
  ) {
    return _voicevox_synthesizer_unload_voice_model(
      synthesizer,
      model_id,
    );
  }

  late final _voicevox_synthesizer_unload_voice_modelPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<VoicevoxSynthesizer>, VoicevoxVoiceModelId)>>(
      'voicevox_synthesizer_unload_voice_model');
  late final _voicevox_synthesizer_unload_voice_model =
      _voicevox_synthesizer_unload_voice_modelPtr.asFunction<
          int Function(
              ffi.Pointer<VoicevoxSynthesizer>, VoicevoxVoiceModelId)>();

  bool voicevox_synthesizer_is_gpu_mode(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
  ) {
    return _voicevox_synthesizer_is_gpu_mode(
      synthesizer,
    );
  }

  late final _voicevox_synthesizer_is_gpu_modePtr = _lookup<
          ffi
          .NativeFunction<ffi.Bool Function(ffi.Pointer<VoicevoxSynthesizer>)>>(
      'voicevox_synthesizer_is_gpu_mode');
  late final _voicevox_synthesizer_is_gpu_mode =
      _voicevox_synthesizer_is_gpu_modePtr
          .asFunction<bool Function(ffi.Pointer<VoicevoxSynthesizer>)>();

  bool voicevox_synthesizer_is_loaded_voice_model(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
    VoicevoxVoiceModelId model_id,
  ) {
    return _voicevox_synthesizer_is_loaded_voice_model(
      synthesizer,
      model_id,
    );
  }

  late final _voicevox_synthesizer_is_loaded_voice_modelPtr = _lookup<
          ffi.NativeFunction<
              ffi.Bool Function(
                  ffi.Pointer<VoicevoxSynthesizer>, VoicevoxVoiceModelId)>>(
      'voicevox_synthesizer_is_loaded_voice_model');
  late final _voicevox_synthesizer_is_loaded_voice_model =
      _voicevox_synthesizer_is_loaded_voice_modelPtr.asFunction<
          bool Function(
              ffi.Pointer<VoicevoxSynthesizer>, VoicevoxVoiceModelId)>();

  ffi.Pointer<ffi.Char> voicevox_synthesizer_create_metas_json(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
  ) {
    return _voicevox_synthesizer_create_metas_json(
      synthesizer,
    );
  }

  late final _voicevox_synthesizer_create_metas_jsonPtr = _lookup<
          ffi.NativeFunction<
              ffi.Pointer<ffi.Char> Function(
                  ffi.Pointer<VoicevoxSynthesizer>)>>(
      'voicevox_synthesizer_create_metas_json');
  late final _voicevox_synthesizer_create_metas_json =
      _voicevox_synthesizer_create_metas_jsonPtr.asFunction<
          ffi.Pointer<ffi.Char> Function(ffi.Pointer<VoicevoxSynthesizer>)>();

  int voicevox_create_supported_devices_json(
    ffi.Pointer<ffi.Pointer<ffi.Char>> output_supported_devices_json,
  ) {
    return _voicevox_create_supported_devices_json(
      output_supported_devices_json,
    );
  }

  late final _voicevox_create_supported_devices_jsonPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<ffi.Pointer<ffi.Char>>)>>(
      'voicevox_create_supported_devices_json');
  late final _voicevox_create_supported_devices_json =
      _voicevox_create_supported_devices_jsonPtr
          .asFunction<int Function(ffi.Pointer<ffi.Pointer<ffi.Char>>)>();

  int voicevox_synthesizer_create_audio_query_from_kana(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
    ffi.Pointer<ffi.Char> kana,
    int style_id,
    ffi.Pointer<ffi.Pointer<ffi.Char>> output_audio_query_json,
  ) {
    return _voicevox_synthesizer_create_audio_query_from_kana(
      synthesizer,
      kana,
      style_id,
      output_audio_query_json,
    );
  }

  late final _voicevox_synthesizer_create_audio_query_from_kanaPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<VoicevoxSynthesizer>,
                  ffi.Pointer<ffi.Char>,
                  VoicevoxStyleId,
                  ffi.Pointer<ffi.Pointer<ffi.Char>>)>>(
      'voicevox_synthesizer_create_audio_query_from_kana');
  late final _voicevox_synthesizer_create_audio_query_from_kana =
      _voicevox_synthesizer_create_audio_query_from_kanaPtr.asFunction<
          int Function(ffi.Pointer<VoicevoxSynthesizer>, ffi.Pointer<ffi.Char>,
              int, ffi.Pointer<ffi.Pointer<ffi.Char>>)>();

  int voicevox_synthesizer_create_audio_query(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
    ffi.Pointer<ffi.Char> text,
    int style_id,
    ffi.Pointer<ffi.Pointer<ffi.Char>> output_audio_query_json,
  ) {
    return _voicevox_synthesizer_create_audio_query(
      synthesizer,
      text,
      style_id,
      output_audio_query_json,
    );
  }

  late final _voicevox_synthesizer_create_audio_queryPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<VoicevoxSynthesizer>,
                  ffi.Pointer<ffi.Char>,
                  VoicevoxStyleId,
                  ffi.Pointer<ffi.Pointer<ffi.Char>>)>>(
      'voicevox_synthesizer_create_audio_query');
  late final _voicevox_synthesizer_create_audio_query =
      _voicevox_synthesizer_create_audio_queryPtr.asFunction<
          int Function(ffi.Pointer<VoicevoxSynthesizer>, ffi.Pointer<ffi.Char>,
              int, ffi.Pointer<ffi.Pointer<ffi.Char>>)>();

  int voicevox_synthesizer_create_accent_phrases_from_kana(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
    ffi.Pointer<ffi.Char> kana,
    int style_id,
    ffi.Pointer<ffi.Pointer<ffi.Char>> output_accent_phrases_json,
  ) {
    return _voicevox_synthesizer_create_accent_phrases_from_kana(
      synthesizer,
      kana,
      style_id,
      output_accent_phrases_json,
    );
  }

  late final _voicevox_synthesizer_create_accent_phrases_from_kanaPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<VoicevoxSynthesizer>,
                  ffi.Pointer<ffi.Char>,
                  VoicevoxStyleId,
                  ffi.Pointer<ffi.Pointer<ffi.Char>>)>>(
      'voicevox_synthesizer_create_accent_phrases_from_kana');
  late final _voicevox_synthesizer_create_accent_phrases_from_kana =
      _voicevox_synthesizer_create_accent_phrases_from_kanaPtr.asFunction<
          int Function(ffi.Pointer<VoicevoxSynthesizer>, ffi.Pointer<ffi.Char>,
              int, ffi.Pointer<ffi.Pointer<ffi.Char>>)>();

  int voicevox_synthesizer_create_accent_phrases(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
    ffi.Pointer<ffi.Char> text,
    int style_id,
    ffi.Pointer<ffi.Pointer<ffi.Char>> output_accent_phrases_json,
  ) {
    return _voicevox_synthesizer_create_accent_phrases(
      synthesizer,
      text,
      style_id,
      output_accent_phrases_json,
    );
  }

  late final _voicevox_synthesizer_create_accent_phrasesPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<VoicevoxSynthesizer>,
                  ffi.Pointer<ffi.Char>,
                  VoicevoxStyleId,
                  ffi.Pointer<ffi.Pointer<ffi.Char>>)>>(
      'voicevox_synthesizer_create_accent_phrases');
  late final _voicevox_synthesizer_create_accent_phrases =
      _voicevox_synthesizer_create_accent_phrasesPtr.asFunction<
          int Function(ffi.Pointer<VoicevoxSynthesizer>, ffi.Pointer<ffi.Char>,
              int, ffi.Pointer<ffi.Pointer<ffi.Char>>)>();

  int voicevox_synthesizer_replace_mora_data(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
    ffi.Pointer<ffi.Char> accent_phrases_json,
    int style_id,
    ffi.Pointer<ffi.Pointer<ffi.Char>> output_accent_phrases_json,
  ) {
    return _voicevox_synthesizer_replace_mora_data(
      synthesizer,
      accent_phrases_json,
      style_id,
      output_accent_phrases_json,
    );
  }

  late final _voicevox_synthesizer_replace_mora_dataPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<VoicevoxSynthesizer>,
                  ffi.Pointer<ffi.Char>,
                  VoicevoxStyleId,
                  ffi.Pointer<ffi.Pointer<ffi.Char>>)>>(
      'voicevox_synthesizer_replace_mora_data');
  late final _voicevox_synthesizer_replace_mora_data =
      _voicevox_synthesizer_replace_mora_dataPtr.asFunction<
          int Function(ffi.Pointer<VoicevoxSynthesizer>, ffi.Pointer<ffi.Char>,
              int, ffi.Pointer<ffi.Pointer<ffi.Char>>)>();

  int voicevox_synthesizer_replace_phoneme_length(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
    ffi.Pointer<ffi.Char> accent_phrases_json,
    int style_id,
    ffi.Pointer<ffi.Pointer<ffi.Char>> output_accent_phrases_json,
  ) {
    return _voicevox_synthesizer_replace_phoneme_length(
      synthesizer,
      accent_phrases_json,
      style_id,
      output_accent_phrases_json,
    );
  }

  late final _voicevox_synthesizer_replace_phoneme_lengthPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<VoicevoxSynthesizer>,
                  ffi.Pointer<ffi.Char>,
                  VoicevoxStyleId,
                  ffi.Pointer<ffi.Pointer<ffi.Char>>)>>(
      'voicevox_synthesizer_replace_phoneme_length');
  late final _voicevox_synthesizer_replace_phoneme_length =
      _voicevox_synthesizer_replace_phoneme_lengthPtr.asFunction<
          int Function(ffi.Pointer<VoicevoxSynthesizer>, ffi.Pointer<ffi.Char>,
              int, ffi.Pointer<ffi.Pointer<ffi.Char>>)>();

  int voicevox_synthesizer_replace_mora_pitch(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
    ffi.Pointer<ffi.Char> accent_phrases_json,
    int style_id,
    ffi.Pointer<ffi.Pointer<ffi.Char>> output_accent_phrases_json,
  ) {
    return _voicevox_synthesizer_replace_mora_pitch(
      synthesizer,
      accent_phrases_json,
      style_id,
      output_accent_phrases_json,
    );
  }

  late final _voicevox_synthesizer_replace_mora_pitchPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<VoicevoxSynthesizer>,
                  ffi.Pointer<ffi.Char>,
                  VoicevoxStyleId,
                  ffi.Pointer<ffi.Pointer<ffi.Char>>)>>(
      'voicevox_synthesizer_replace_mora_pitch');
  late final _voicevox_synthesizer_replace_mora_pitch =
      _voicevox_synthesizer_replace_mora_pitchPtr.asFunction<
          int Function(ffi.Pointer<VoicevoxSynthesizer>, ffi.Pointer<ffi.Char>,
              int, ffi.Pointer<ffi.Pointer<ffi.Char>>)>();

  VoicevoxSynthesisOptions voicevox_make_default_synthesis_options() {
    return _voicevox_make_default_synthesis_options();
  }

  late final _voicevox_make_default_synthesis_optionsPtr =
      _lookup<ffi.NativeFunction<VoicevoxSynthesisOptions Function()>>(
          'voicevox_make_default_synthesis_options');
  late final _voicevox_make_default_synthesis_options =
      _voicevox_make_default_synthesis_optionsPtr
          .asFunction<VoicevoxSynthesisOptions Function()>();

  int voicevox_synthesizer_synthesis(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
    ffi.Pointer<ffi.Char> audio_query_json,
    int style_id,
    VoicevoxSynthesisOptions options,
    ffi.Pointer<ffi.UintPtr> output_wav_length,
    ffi.Pointer<ffi.Pointer<ffi.Uint8>> output_wav,
  ) {
    return _voicevox_synthesizer_synthesis(
      synthesizer,
      audio_query_json,
      style_id,
      options,
      output_wav_length,
      output_wav,
    );
  }

  late final _voicevox_synthesizer_synthesisPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<VoicevoxSynthesizer>,
                  ffi.Pointer<ffi.Char>,
                  VoicevoxStyleId,
                  VoicevoxSynthesisOptions,
                  ffi.Pointer<ffi.UintPtr>,
                  ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>>(
      'voicevox_synthesizer_synthesis');
  late final _voicevox_synthesizer_synthesis =
      _voicevox_synthesizer_synthesisPtr.asFunction<
          int Function(
              ffi.Pointer<VoicevoxSynthesizer>,
              ffi.Pointer<ffi.Char>,
              int,
              VoicevoxSynthesisOptions,
              ffi.Pointer<ffi.UintPtr>,
              ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>();

  VoicevoxTtsOptions voicevox_make_default_tts_options() {
    return _voicevox_make_default_tts_options();
  }

  late final _voicevox_make_default_tts_optionsPtr =
      _lookup<ffi.NativeFunction<VoicevoxTtsOptions Function()>>(
          'voicevox_make_default_tts_options');
  late final _voicevox_make_default_tts_options =
      _voicevox_make_default_tts_optionsPtr
          .asFunction<VoicevoxTtsOptions Function()>();

  int voicevox_synthesizer_tts_from_kana(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
    ffi.Pointer<ffi.Char> kana,
    int style_id,
    VoicevoxTtsOptions options,
    ffi.Pointer<ffi.UintPtr> output_wav_length,
    ffi.Pointer<ffi.Pointer<ffi.Uint8>> output_wav,
  ) {
    return _voicevox_synthesizer_tts_from_kana(
      synthesizer,
      kana,
      style_id,
      options,
      output_wav_length,
      output_wav,
    );
  }

  late final _voicevox_synthesizer_tts_from_kanaPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<VoicevoxSynthesizer>,
                  ffi.Pointer<ffi.Char>,
                  VoicevoxStyleId,
                  VoicevoxTtsOptions,
                  ffi.Pointer<ffi.UintPtr>,
                  ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>>(
      'voicevox_synthesizer_tts_from_kana');
  late final _voicevox_synthesizer_tts_from_kana =
      _voicevox_synthesizer_tts_from_kanaPtr.asFunction<
          int Function(
              ffi.Pointer<VoicevoxSynthesizer>,
              ffi.Pointer<ffi.Char>,
              int,
              VoicevoxTtsOptions,
              ffi.Pointer<ffi.UintPtr>,
              ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>();

  int voicevox_synthesizer_tts(
    ffi.Pointer<VoicevoxSynthesizer> synthesizer,
    ffi.Pointer<ffi.Char> text,
    int style_id,
    VoicevoxTtsOptions options,
    ffi.Pointer<ffi.UintPtr> output_wav_length,
    ffi.Pointer<ffi.Pointer<ffi.Uint8>> output_wav,
  ) {
    return _voicevox_synthesizer_tts(
      synthesizer,
      text,
      style_id,
      options,
      output_wav_length,
      output_wav,
    );
  }

  late final _voicevox_synthesizer_ttsPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<VoicevoxSynthesizer>,
                  ffi.Pointer<ffi.Char>,
                  VoicevoxStyleId,
                  VoicevoxTtsOptions,
                  ffi.Pointer<ffi.UintPtr>,
                  ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>>(
      'voicevox_synthesizer_tts');
  late final _voicevox_synthesizer_tts =
      _voicevox_synthesizer_ttsPtr.asFunction<
          int Function(
              ffi.Pointer<VoicevoxSynthesizer>,
              ffi.Pointer<ffi.Char>,
              int,
              VoicevoxTtsOptions,
              ffi.Pointer<ffi.UintPtr>,
              ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>();

  void voicevox_json_free(
    ffi.Pointer<ffi.Char> json,
  ) {
    return _voicevox_json_free(
      json,
    );
  }

  late final _voicevox_json_freePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Char>)>>(
          'voicevox_json_free');
  late final _voicevox_json_free =
      _voicevox_json_freePtr.asFunction<void Function(ffi.Pointer<ffi.Char>)>();

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
          ffi
          .NativeFunction<ffi.Pointer<ffi.Char> Function(VoicevoxResultCode1)>>(
      'voicevox_error_result_to_message');
  late final _voicevox_error_result_to_message =
      _voicevox_error_result_to_messagePtr
          .asFunction<ffi.Pointer<ffi.Char> Function(int)>();

  VoicevoxUserDictWord voicevox_user_dict_word_make(
    ffi.Pointer<ffi.Char> surface,
    ffi.Pointer<ffi.Char> pronunciation,
  ) {
    return _voicevox_user_dict_word_make(
      surface,
      pronunciation,
    );
  }

  late final _voicevox_user_dict_word_makePtr = _lookup<
      ffi.NativeFunction<
          VoicevoxUserDictWord Function(ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.Char>)>>('voicevox_user_dict_word_make');
  late final _voicevox_user_dict_word_make =
      _voicevox_user_dict_word_makePtr.asFunction<
          VoicevoxUserDictWord Function(
              ffi.Pointer<ffi.Char>, ffi.Pointer<ffi.Char>)>();

  ffi.Pointer<VoicevoxUserDict> voicevox_user_dict_new() {
    return _voicevox_user_dict_new();
  }

  late final _voicevox_user_dict_newPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<VoicevoxUserDict> Function()>>(
          'voicevox_user_dict_new');
  late final _voicevox_user_dict_new = _voicevox_user_dict_newPtr
      .asFunction<ffi.Pointer<VoicevoxUserDict> Function()>();

  int voicevox_user_dict_load(
    ffi.Pointer<VoicevoxUserDict> user_dict,
    ffi.Pointer<ffi.Char> dict_path,
  ) {
    return _voicevox_user_dict_load(
      user_dict,
      dict_path,
    );
  }

  late final _voicevox_user_dict_loadPtr = _lookup<
      ffi.NativeFunction<
          VoicevoxResultCode1 Function(ffi.Pointer<VoicevoxUserDict>,
              ffi.Pointer<ffi.Char>)>>('voicevox_user_dict_load');
  late final _voicevox_user_dict_load = _voicevox_user_dict_loadPtr.asFunction<
      int Function(ffi.Pointer<VoicevoxUserDict>, ffi.Pointer<ffi.Char>)>();

  int voicevox_user_dict_add_word(
    ffi.Pointer<VoicevoxUserDict> user_dict,
    ffi.Pointer<VoicevoxUserDictWord> word,
    ffi.Pointer<ffi.Pointer<ffi.Uint8>> output_word_uuid,
  ) {
    return _voicevox_user_dict_add_word(
      user_dict,
      word,
      output_word_uuid,
    );
  }

  late final _voicevox_user_dict_add_wordPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<VoicevoxUserDict>,
                  ffi.Pointer<VoicevoxUserDictWord>,
                  ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>>(
      'voicevox_user_dict_add_word');
  late final _voicevox_user_dict_add_word =
      _voicevox_user_dict_add_wordPtr.asFunction<
          int Function(
              ffi.Pointer<VoicevoxUserDict>,
              ffi.Pointer<VoicevoxUserDictWord>,
              ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>();

  int voicevox_user_dict_update_word(
    ffi.Pointer<VoicevoxUserDict> user_dict,
    ffi.Pointer<ffi.Pointer<ffi.Uint8>> word_uuid,
    ffi.Pointer<VoicevoxUserDictWord> word,
  ) {
    return _voicevox_user_dict_update_word(
      user_dict,
      word_uuid,
      word,
    );
  }

  late final _voicevox_user_dict_update_wordPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(
                  ffi.Pointer<VoicevoxUserDict>,
                  ffi.Pointer<ffi.Pointer<ffi.Uint8>>,
                  ffi.Pointer<VoicevoxUserDictWord>)>>(
      'voicevox_user_dict_update_word');
  late final _voicevox_user_dict_update_word =
      _voicevox_user_dict_update_wordPtr.asFunction<
          int Function(
              ffi.Pointer<VoicevoxUserDict>,
              ffi.Pointer<ffi.Pointer<ffi.Uint8>>,
              ffi.Pointer<VoicevoxUserDictWord>)>();

  int voicevox_user_dict_remove_word(
    ffi.Pointer<VoicevoxUserDict> user_dict,
    ffi.Pointer<ffi.Pointer<ffi.Uint8>> word_uuid,
  ) {
    return _voicevox_user_dict_remove_word(
      user_dict,
      word_uuid,
    );
  }

  late final _voicevox_user_dict_remove_wordPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(ffi.Pointer<VoicevoxUserDict>,
                  ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>>(
      'voicevox_user_dict_remove_word');
  late final _voicevox_user_dict_remove_word =
      _voicevox_user_dict_remove_wordPtr.asFunction<
          int Function(ffi.Pointer<VoicevoxUserDict>,
              ffi.Pointer<ffi.Pointer<ffi.Uint8>>)>();

  int voicevox_user_dict_to_json(
    ffi.Pointer<VoicevoxUserDict> user_dict,
    ffi.Pointer<ffi.Pointer<ffi.Char>> output_json,
  ) {
    return _voicevox_user_dict_to_json(
      user_dict,
      output_json,
    );
  }

  late final _voicevox_user_dict_to_jsonPtr = _lookup<
          ffi.NativeFunction<
              VoicevoxResultCode1 Function(ffi.Pointer<VoicevoxUserDict>,
                  ffi.Pointer<ffi.Pointer<ffi.Char>>)>>(
      'voicevox_user_dict_to_json');
  late final _voicevox_user_dict_to_json =
      _voicevox_user_dict_to_jsonPtr.asFunction<
          int Function(ffi.Pointer<VoicevoxUserDict>,
              ffi.Pointer<ffi.Pointer<ffi.Char>>)>();

  int voicevox_user_dict_import(
    ffi.Pointer<VoicevoxUserDict> user_dict,
    ffi.Pointer<VoicevoxUserDict> other_dict,
  ) {
    return _voicevox_user_dict_import(
      user_dict,
      other_dict,
    );
  }

  late final _voicevox_user_dict_importPtr = _lookup<
      ffi.NativeFunction<
          VoicevoxResultCode1 Function(ffi.Pointer<VoicevoxUserDict>,
              ffi.Pointer<VoicevoxUserDict>)>>('voicevox_user_dict_import');
  late final _voicevox_user_dict_import =
      _voicevox_user_dict_importPtr.asFunction<
          int Function(
              ffi.Pointer<VoicevoxUserDict>, ffi.Pointer<VoicevoxUserDict>)>();

  int voicevox_user_dict_save(
    ffi.Pointer<VoicevoxUserDict> user_dict,
    ffi.Pointer<ffi.Char> path,
  ) {
    return _voicevox_user_dict_save(
      user_dict,
      path,
    );
  }

  late final _voicevox_user_dict_savePtr = _lookup<
      ffi.NativeFunction<
          VoicevoxResultCode1 Function(ffi.Pointer<VoicevoxUserDict>,
              ffi.Pointer<ffi.Char>)>>('voicevox_user_dict_save');
  late final _voicevox_user_dict_save = _voicevox_user_dict_savePtr.asFunction<
      int Function(ffi.Pointer<VoicevoxUserDict>, ffi.Pointer<ffi.Char>)>();

  void voicevox_user_dict_delete(
    ffi.Pointer<VoicevoxUserDict> user_dict,
  ) {
    return _voicevox_user_dict_delete(
      user_dict,
    );
  }

  late final _voicevox_user_dict_deletePtr = _lookup<
          ffi.NativeFunction<ffi.Void Function(ffi.Pointer<VoicevoxUserDict>)>>(
      'voicevox_user_dict_delete');
  late final _voicevox_user_dict_delete = _voicevox_user_dict_deletePtr
      .asFunction<void Function(ffi.Pointer<VoicevoxUserDict>)>();
}

/// ハードウェアアクセラレーションモードを設定する設定値。
abstract class VoicevoxAccelerationMode {
  /// 実行環境に合った適切なハードウェアアクセラレーションモードを選択する
  static const int VOICEVOX_ACCELERATION_MODE_AUTO = 0;

  /// ハードウェアアクセラレーションモードを"CPU"に設定する
  static const int VOICEVOX_ACCELERATION_MODE_CPU = 1;

  /// ハードウェアアクセラレーションモードを"GPU"に設定する
  static const int VOICEVOX_ACCELERATION_MODE_GPU = 2;
}

/// 処理結果を示す結果コード。
abstract class VoicevoxResultCode {
  /// 成功
  static const int VOICEVOX_RESULT_OK = 0;

  /// open_jtalk辞書ファイルが読み込まれていない
  static const int VOICEVOX_RESULT_NOT_LOADED_OPENJTALK_DICT_ERROR = 1;

  /// サポートされているデバイス情報取得に失敗した
  static const int VOICEVOX_RESULT_GET_SUPPORTED_DEVICES_ERROR = 3;

  /// GPUモードがサポートされていない
  static const int VOICEVOX_RESULT_GPU_SUPPORT_ERROR = 4;

  /// スタイルIDに対するスタイルが見つからなかった
  static const int VOICEVOX_RESULT_STYLE_NOT_FOUND_ERROR = 6;

  /// 音声モデルIDに対する音声モデルが見つからなかった
  static const int VOICEVOX_RESULT_MODEL_NOT_FOUND_ERROR = 7;

  /// 推論に失敗した
  static const int VOICEVOX_RESULT_INFERENCE_ERROR = 8;

  /// コンテキストラベル出力に失敗した
  static const int VOICEVOX_RESULT_EXTRACT_FULL_CONTEXT_LABEL_ERROR = 11;

  /// 無効なutf8文字列が入力された
  static const int VOICEVOX_RESULT_INVALID_UTF8_INPUT_ERROR = 12;

  /// AquesTalk風記法のテキストの解析に失敗した
  static const int VOICEVOX_RESULT_PARSE_KANA_ERROR = 13;

  /// 無効なAudioQuery
  static const int VOICEVOX_RESULT_INVALID_AUDIO_QUERY_ERROR = 14;

  /// 無効なAccentPhrase
  static const int VOICEVOX_RESULT_INVALID_ACCENT_PHRASE_ERROR = 15;

  /// ZIPファイルを開くことに失敗した
  static const int VOICEVOX_RESULT_OPEN_ZIP_FILE_ERROR = 16;

  /// ZIP内のファイルが読めなかった
  static const int VOICEVOX_RESULT_READ_ZIP_ENTRY_ERROR = 17;

  /// すでに読み込まれている音声モデルを読み込もうとした
  static const int VOICEVOX_RESULT_MODEL_ALREADY_LOADED_ERROR = 18;

  /// すでに読み込まれているスタイルを読み込もうとした
  static const int VOICEVOX_RESULT_STYLE_ALREADY_LOADED_ERROR = 26;

  /// 無効なモデルデータ
  static const int VOICEVOX_RESULT_INVALID_MODEL_DATA_ERROR = 27;

  /// ユーザー辞書を読み込めなかった
  static const int VOICEVOX_RESULT_LOAD_USER_DICT_ERROR = 20;

  /// ユーザー辞書を書き込めなかった
  static const int VOICEVOX_RESULT_SAVE_USER_DICT_ERROR = 21;

  /// ユーザー辞書に単語が見つからなかった
  static const int VOICEVOX_RESULT_USER_DICT_WORD_NOT_FOUND_ERROR = 22;

  /// OpenJTalkのユーザー辞書の設定に失敗した
  static const int VOICEVOX_RESULT_USE_USER_DICT_ERROR = 23;

  /// ユーザー辞書の単語のバリデーションに失敗した
  static const int VOICEVOX_RESULT_INVALID_USER_DICT_WORD_ERROR = 24;

  /// UUIDの変換に失敗した
  static const int VOICEVOX_RESULT_INVALID_UUID_ERROR = 25;
}

/// ユーザー辞書の単語の種類。
abstract class VoicevoxUserDictWordType {
  /// 固有名詞。
  static const int VOICEVOX_USER_DICT_WORD_TYPE_PROPER_NOUN = 0;

  /// 一般名詞。
  static const int VOICEVOX_USER_DICT_WORD_TYPE_COMMON_NOUN = 1;

  /// 動詞。
  static const int VOICEVOX_USER_DICT_WORD_TYPE_VERB = 2;

  /// 形容詞。
  static const int VOICEVOX_USER_DICT_WORD_TYPE_ADJECTIVE = 3;

  /// 接尾辞。
  static const int VOICEVOX_USER_DICT_WORD_TYPE_SUFFIX = 4;
}

final class OpenJtalkRc extends ffi.Opaque {}

final class VoicevoxSynthesizer extends ffi.Opaque {}

final class VoicevoxUserDict extends ffi.Opaque {}

final class VoicevoxVoiceModel extends ffi.Opaque {}

/// ::voicevox_synthesizer_new_with_initialize のオプション。
final class VoicevoxInitializeOptions extends ffi.Struct {
  /// ハードウェアアクセラレーションモード
  @VoicevoxAccelerationMode1()
  external int acceleration_mode;

  /// CPU利用数を指定
  /// 0を指定すると環境に合わせたCPUが利用される
  @ffi.Uint16()
  external int cpu_num_threads;
}

typedef VoicevoxAccelerationMode1 = ffi.Int32;

/// ::voicevox_synthesizer_synthesis のオプション。
final class VoicevoxSynthesisOptions extends ffi.Struct {
  /// 疑問文の調整を有効にする
  @ffi.Bool()
  external bool enable_interrogative_upspeak;
}

/// ::voicevox_synthesizer_tts のオプション。
final class VoicevoxTtsOptions extends ffi.Struct {
  /// 疑問文の調整を有効にする
  @ffi.Bool()
  external bool enable_interrogative_upspeak;
}

/// ユーザー辞書の単語。
final class VoicevoxUserDictWord extends ffi.Struct {
  /// 表記
  external ffi.Pointer<ffi.Char> surface;

  /// 読み
  external ffi.Pointer<ffi.Char> pronunciation;

  /// アクセント型
  @ffi.UintPtr()
  external int accent_type;

  /// 単語の種類
  @VoicevoxUserDictWordType1()
  external int word_type;

  /// 優先度
  @ffi.Uint32()
  external int priority;
}

typedef VoicevoxUserDictWordType1 = ffi.Int32;
typedef VoicevoxResultCode1 = ffi.Int32;

/// 音声モデルID。
typedef VoicevoxVoiceModelId = ffi.Pointer<ffi.Char>;

/// スタイルID。
///
/// VOICEVOXにおける、ある<b>話者</b>(_speaker_)のある<b>スタイル</b>(_style_)を指す。
typedef VoicevoxStyleId = ffi.Uint32;
