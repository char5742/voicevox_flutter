# voicevox_flutter

[voicevox_core](https://github.com/VOICEVOX/voicevox_core) の 非公式 ラッパーです。  
**※現在はAndroidのみで動作します。**

## 使い方

voicevox_coreのAndroid向けライブラリを[公式](https://github.com/VOICEVOX/voicevox_core/releases)からダウンロードし、`android/src/main/jniLibs/arm64-v8a/libvoicevox_core.so`を置き換えてください。

自分のFlutterアプリで使用する場合は以下のようにしてください。

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

modelフォルダは公式ライブラリに同梱されています。
openjtalkは[こちら](https://open-jtalk.sourceforge.net/)からダウンロードできます。

実際の使用方法は[example](example)を参考にしてください。

## 高レベルAPI
VoicevoxFlutterクラスは現在audioQuery, synthesis, tts のみをサポートしています。

## 低レベルAPI
[voicevox_flutter/generated_bindings.dart](lib/generated_bindings.dart)に[ffigen](https://github.com/dart-lang/ffigen)で生成しただけのものがあります。


## ライセンス
MITライセンスが適用されています。[LICENSE](LICENSE)を参照してください。