import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});
  static String path = "/imagePicker";

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? file;
  List<File> images = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              file = await pickImage(ImageSource.gallery);
              setState(() {});
            },
            child: const Text("Gallery"),
          ),
          ElevatedButton(
            onPressed: () async {
              file = await pickImage(ImageSource.camera);
              setState(() {});
            },
            child: const Text("Camera"),
          ),
          ElevatedButton(
            onPressed: () async {
              images = await multiImagePicker();
              setState(() {});
            },
            child: const Text("Multiple Images"),
          ),
          file == null ? const Text("No Images") : Image.file(file!),
          Expanded(
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(images[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<File?> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    File? file;
    await picker.pickImage(source: source).then(
      (value) {
        if (value == null) {
        } else {
          file = File(value.path);
        }
      },
    );
    return file;
  }

  Future<List<File>> multiImagePicker() async {
    ImagePicker picker = ImagePicker();
    List<File> files = [];
    await picker.pickMultiImage().then((value) {
      if (value != null) {
        for (var item in value) {
          files.add(File(item.path));
        }
      }
    });
    return files;
  }
}
