import 'package:flutter/material.dart';

class GoogleMapsPage extends StatelessWidget {
  const GoogleMapsPage({super.key});
  static String path = "/googleMaps";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps"),
      ),
    );
  }
}
