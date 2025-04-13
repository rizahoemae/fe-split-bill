import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import './preview_page.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
    required this.onCameraSwitch,
  });

  final CameraDescription camera;
  final VoidCallback onCameraSwitch;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initCamera(widget.camera);
  }

  void _initCamera(CameraDescription camera) {
    _controller = CameraController(camera, ResolutionPreset.max);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final size = MediaQuery.of(context).size;
                final deviceRatio = size.width / size.height;

                final lensDirection = _controller.description.lensDirection;
                if (lensDirection == CameraLensDirection.front) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: CameraPreview(_controller),
                  );
                } else {
                  return Transform.scale(
                    scale: _controller.value.aspectRatio / deviceRatio,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: CameraPreview(_controller),
                      ),
                    ),
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  // widget.onCameraSwitch();

                  final lensDirection = _controller.description.lensDirection;
                  CameraDescription newDescription;
                  final cameras = await availableCameras();
                  if (lensDirection == CameraLensDirection.front) {
                    newDescription = cameras.firstWhere(
                      (description) =>
                          description.lensDirection == CameraLensDirection.back,
                    );
                  } else {
                    newDescription = cameras.firstWhere(
                      (description) =>
                          description.lensDirection ==
                          CameraLensDirection.front,
                    );
                  }
                  if (newDescription != null) {
                    _initCamera(newDescription);
                  }

                  setState(() {});
                },
                child:
                    _controller.description.lensDirection ==
                            CameraLensDirection.back
                        ? Icon(Icons.camera_front)
                        : Icon(Icons.camera_rear),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await _initializeControllerFuture;
                    final image = await _controller.takePicture();
                    await _controller.setFlashMode(FlashMode.off);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                DisplayPictureScreen(imagePath: image.path),
                      ),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
                child: Icon(Icons.camera),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await _initializeControllerFuture;
                    FlashMode flashMode = _controller.value.flashMode;
                    if (flashMode == FlashMode.off) {
                      await _controller.setFlashMode(FlashMode.torch);
                    } else {
                      await _controller.setFlashMode(FlashMode.off);
                    }

                    setState(() {});
                  } catch (err) {
                    print(err);
                  }
                },
                child:
                    _controller.value.flashMode == FlashMode.torch
                        ? Icon(Icons.flash_off)
                        : Icon(Icons.flash_on),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
