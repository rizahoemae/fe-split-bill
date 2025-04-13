import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
// import 'layout.dart';
import 'dart:io';
import 'views/camera/camera_page.dart';
import 'views/receipt/scanned_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key, required this.firstCamera});
  // final CameraDescription firstCamera;

  // @override initState() {
  //   super.initState();
  //   // Obtain a list of the available cameras on the device.
  //   availableCameras().then((cameras) {
  //     // Get a specific camera from the list of available cameras.
  //     firstCamera = cameras.first;
  //   });
  // }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ScannedReceipt(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CameraDescription? firstCamera;
  @override
  void initState() {
    super.initState();
    _setupCamera();
    // super.initState();
    // WidgetsFlutterBinding.ensureInitialized();
    // availableCameras().then((cameras) {
    //   // Get a specific camera from the list of available cameras.
    //   firstCamera = cameras.first;
    // });
    // firstCamera = cameras.first;
  }

  void _setupCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      if (firstCamera == cameras.first) {
        setState(() {
          firstCamera = cameras.last;
        });
      } else {
        setState(() {
          firstCamera = cameras.first;
        });
      }
    }
  }

  // void switchCamera() {
  //   // Switch camera logic
  //   setState(() {
  //     firstCamera = cameras.first;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isAndroid) {
      return TakePictureScreen(
        camera: firstCamera!,
        onCameraSwitch: _setupCamera,
      );
    } else {
      return const Center(child: Text('This platform is not ok supported'));
    }
  }
}
