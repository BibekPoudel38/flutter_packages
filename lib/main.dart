import 'package:flutter/material.dart';
import 'package:packages/audio_player.dart';
import 'package:packages/google_maps.dart';
import 'package:packages/homepage.dart';
import 'package:packages/image_picker.dart';
import 'package:packages/video_player.dart';
import 'package:packages/webview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
      routes: {
        AudioPlayerPage.path: (_) => const AudioPlayerPage(),
        GoogleMapsPage.path: (_) => GoogleMapsPage(),
        ImagePickerPage.path: (_) => const ImagePickerPage(),
        VideoPlayerPage.path: (_) => const VideoPlayerPage(),
        WebViewPage.path: (_) => const WebViewPage(),
      },
    );
  }
}
