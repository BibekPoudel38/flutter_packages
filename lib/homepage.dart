import 'package:flutter/material.dart';
import 'package:packages/audio_player.dart';
import 'package:packages/google_maps.dart';
import 'package:packages/image_picker.dart';
import 'package:packages/video_player.dart';
import 'package:packages/webview_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.audio_file),
            title: const Text("Audio Player"),
            onTap: () {
              Navigator.pushNamed(context, AudioPlayerPage.path);
            },
          ),
          ListTile(
            leading: const Icon(Icons.video_collection),
            title: const Text("Video Player"),
            onTap: () {
              Navigator.pushNamed(context, VideoPlayerPage.path);
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text("Image Picker"),
            onTap: () {
              Navigator.pushNamed(context, ImagePickerPage.path);
            },
          ),
          ListTile(
            leading: const Icon(Icons.web),
            title: const Text("Web View"),
            onTap: () {
              Navigator.pushNamed(context, WebViewPage.path);
            },
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text("Google Maps"),
            onTap: () {
              Navigator.pushNamed(context, GoogleMapsPage.path);
            },
          ),
        ],
      ),
    );
  }
}
