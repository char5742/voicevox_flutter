import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final service = NativeVoiceService();
  await service.initialize();
  final audioPlayer = AudioPlayer();
  runApp(MyApp(service, audioPlayer));
}

class MyApp extends StatelessWidget {
  const MyApp(this.service, this.audioPlayer, {super.key});
  final NativeVoiceService service;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: controller),
                ElevatedButton(
                  onPressed: () async {
                    // speakerIdを変更すれば話者を変えられます。
                    const speakerId = 1;
                    final query =
                        await service.audioQuery(controller.text, speakerId);
                    final wavPath = await service.synthesis(query, speakerId);
                    await audioPlayer.play(DeviceFileSource(wavPath));
                  },
                  child: const Text('再生'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
