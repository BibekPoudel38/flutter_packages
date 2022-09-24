import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});
  static String path = "/audioPlayer";

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    loadAudio();

    player.positionStream.listen((event) {});
  }

  loadAudio() async {
    await player
        .setUrl(
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3",
    )
        .then((value) {
      log(value!.inSeconds.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Player"),
      ),
      body: Container(
        child: Column(
          children: [
            StreamBuilder(
              stream: player.durationStream,
              builder: (context, snapshot) {
                return snapshot.data == null
                    ? const Text("Null")
                    : Text(snapshot.data!.inSeconds.toString());
              },
            ),
            ElevatedButton(
              onPressed: () {
                player.play();
              },
              child: const Text("Play"),
            ),
            ElevatedButton(
              onPressed: () async {
                await player.pause();
              },
              child: const Text("Pause"),
            ),
            const LinearProgressIndicator(
              value: 0.4,
            ),
            Slider(
              value: 45,
              onChanged: (value) {},
              max: 100,
            ),
          ],
        ),
      ),
    );
  }
}
