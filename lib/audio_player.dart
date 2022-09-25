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
  int value = 0;
  @override
  void initState() {
    super.initState();
    loadAudio();

    player.positionStream.listen((event) {
      value = event.inSeconds;
      setState(() {});
    });
  }

  Duration? duration = Duration.zero;
  loadAudio() async {
    duration = await player.setAsset(
      "assets/Kalimba.mp3",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Player"),
      ),
      body: Column(
        children: [
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

          StreamBuilder<Duration>(
            stream: player.positionStream,
            builder: (context, val) {
              return val.data == null
                  ? const Text("Null")
                  : Text(val.data!.inSeconds.toString());
            },
          ),
          duration == null
              ? Container()
              : Slider(
                  value: value.toDouble(),
                  onChanged: (val) {
                    player.seek(Duration(seconds: val.toInt()));
                  },
                  max: duration!.inSeconds.toDouble(),
                ),

          // Column(
          //   children: [
          //     Text(value.toString()),
          //     LinearProgressIndicator(
          //       value: 1 - (value / duration!.inSeconds),
          //     ),
          //     Slider(
          //       value: value.toDouble(),
          //       onChanged: (value) {
          //         player.seek(Duration(seconds: value.toInt()));
          //       },
          //       max: duration!.inSeconds.toDouble(),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
