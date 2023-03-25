// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

// import 'c_warrper.dart';
import 'generated_bindings.dart';
import 'voicevox_flutter_platform_interface.dart';

class VoicevoxFlutter extends VoicevoxCoreLibrary {
  static final VoicevoxFlutter instance =
      VoicevoxFlutter._(DynamicLibrary.open('libvoicevox_core.so'));
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
      throw Exception('VoicevoxResultCode: $code');
    }
  }

  Future<String> audioQuery(String text, {bool kana = false}) async {
    final defaultQueryOption = voicevox_make_default_audio_query_options();
    defaultQueryOption.kana = kana;
    Pointer<Pointer<Char>> outputPtr = calloc<Pointer<Char>>();
    final code = voicevox_audio_query(
      text.toNativeUtf8().cast<Char>(),
      0,
      defaultQueryOption,
      outputPtr,
    );
    if (code != VoicevoxResultCode.VOICEVOX_RESULT_OK) {
      throw Exception('VoicevoxResultCode: $code');
    }
    final query = outputPtr.value.cast<Utf8>().toDartString();
    calloc.free(outputPtr);
    return query;
  }

  Future<void> synthesis(String query, String outputPath) async {
    final synthesisOptions = voicevox_make_default_synthesis_options();
    synthesisOptions.enable_interrogative_upspeak = true;
    final Pointer<UintPtr> outputWavLengthPtr = calloc<UintPtr>();

    Pointer<Pointer<Uint8>> outputWavPtr = calloc<Pointer<Uint8>>();
    final queryPtr = query.toNativeUtf8();
    final code = voicevox_synthesis(
      queryPtr.cast<Char>(),
      0,
      synthesisOptions,
      outputWavLengthPtr,
      outputWavPtr,
    );

    final wavFile = File(outputPath);

    wavFile.writeAsBytesSync(
        outputWavPtr.value.asTypedList(outputWavLengthPtr.value));

    calloc.free(outputWavLengthPtr);
    calloc.free(outputWavPtr);

    if (code != VoicevoxResultCode.VOICEVOX_RESULT_OK) {
      throw Exception('VoicevoxResultCode: $code');
    }
  }
}
