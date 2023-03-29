# voicevox_flutter

[voicevox_core](https://github.com/VOICEVOX/voicevox_core) の 非公式 ラッパーです。

example app

<img src="screen_shot/sample.jpg" width="320px"/>

# 使い方

voicevox_coreのAndroid向けライブラリを[公式](https://github.com/VOICEVOX/voicevox_core/releases)からダウンロードし、`android/src/main/jniLibs/arm64-v8a/libvoicevox_core.so`、`assets/model`を置き換えてください。

自分のFlutterアプリで使用する場合は以下

pubspec.yaml
```yaml
dependencies:
  voicevox_flutter:
    path: /path/to/voicevox_flutter

flutter:
  assets:
    - assets/open_jtalk_dic_utf_8-1.11/
    - assets/model/

```

実際の使用方法はexampleを参考にしてください。

# 高レベルAPI
VoicevoxFlutterクラスは現在audioQuery, synthesis, tts のみをサポートしています。

# 例レベルAPI
[voicevox_flutter/generated_bindings.dart](lib/generated_bindings.dart)に[ffigen](https://github.com/dart-lang/ffigen)で生成しただけのものがあります。

