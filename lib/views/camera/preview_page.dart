import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
// A screen that allows users to take a picture using a given camera.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.file(File(imagePath));
  }
}
