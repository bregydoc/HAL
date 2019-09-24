import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:hal/console.dart';

import 'package:hal/hal.dart';

import 'package:hal/mocks/activities.dart';
import 'package:hal/options.dart';
import 'package:hal/state/global.dart';

import 'package:pigment/pigment.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project HAL',
      theme: ThemeData(
        primaryColor: Pigment.fromString("black"),
        fontFamily: "FiraCode",
        accentColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  HALTerminal terminal;
  MyHomePage() {
    terminal = HALTerminal();
  }
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CameraController controller;
  bool first = true;
  final FaceDetector faceDetector = FirebaseVision.instance.faceDetector();

  _MyHomePageState() {
    Timer.periodic(Duration(milliseconds: 500), (_) => this.setState(() => {}));
  }

  _toggleOptions() {
    GlobalState.onInteractCallback();
    this.setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[1], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      controller.startImageStream((CameraImage cameraImage) {
        if (first) {
          print("WIDTH: ${cameraImage.width}, HEIGHT: ${cameraImage.height}");
          print(cameraImage.planes.map((plane) => plane.bytes.length));

          // // final Plane plane = cameraImage.planes[0];
          // // print("cameraImage.format.group: ${cameraImage.format.group}");
          
          // // ByteBuffer Y = ByteBuffer.wrap(cameraImage.planes[0]);
          // // ByteBuffer U = ByteBuffer.wrap(cameraImage.planes[1]);
          // // ByteBuffer V = ByteBuffer.wrap(cameraImage.planes[2]);

          // // int Yb = Y.remaining();
          // // int Ub = U.remaining();
          // // int Vb = V.remaining();

          // // byte[] data = new byte[Yb + Ub + Vb];

          // // Y.get(data, 0, Yb);
          // // V.get(data, Yb, Vb);
          // // U.get(data, Yb + Vb, Ub);

          // // Bitmap bitmapRaw = Bitmap.createBitmap(imageWidth, imageHeight, Bitmap.Config.ARGB_8888);
          // // Allocation bmData = renderScriptNV21ToRGBA888(
          // //     mRegistrar.context(),
          // //     imageWidth,
          // //     imageHeight,
          // //     data);
          // // bmData.copyTo(bitmapRaw);
          // // final FirebaseVisionImage visionImage = FirebaseVisionImage.fromBytes(
          // //   plane.bytes,
          // //   FirebaseVisionImageMetadata(
          // //     size: Size(
          // //       cameraImage.width.toDouble(),
          // //       cameraImage.height.toDouble(),
          // //     ),
          // //     planeData: cameraImage.planes
          // //         .map(
          // //           (p) => FirebaseVisionImagePlaneMetadata(
          // //             bytesPerRow: p.bytesPerRow,
          // //             width: p.width,
          // //             height: p.height,
          // //           ),
          // //         )
          // //         .toList(),
          // //     rawFormat: cameraImage.format.raw,
          // //     rotation: ImageRotation.rotation0,
          // //   ),
          // // );

          // faceDetector.processImage(visionImage).then((faces) {
          //   print("faces detected: ${faces.length}");
          // });

          first = false;
        }
      });

      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 90.0),
                child: HALHardware(this.widget.terminal, this._toggleOptions),
              ),
              controller.value.isInitialized
                  ? Container(
                      // aspectRatio: controller.value.aspectRatio,
                      width: 100.0,
                      height: 100.0,
                      child: CameraPreview(controller),
                    )
                  : Container(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 230.0,
                    width: MediaQuery.of(context).size.width,
                    child: Material(
                      color: Colors.transparent,
                      type: MaterialType.transparency,
                      child: ListView(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 20.0,
                        ),
                        children: <Widget>[
                          ...activities.map((f) => f.representation),
                          Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            // child: ,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 180),
            right: GlobalState.interacting ? 0 : -20,
            top: MediaQuery.of(context).size.height / 2 - 80.0,
            child: Container(
              padding: EdgeInsets.only(right: 18.0, bottom: 10.0),
              child: Options(
                callback: (o) {
                  if (o == OptionType.Done) {
                    this._toggleOptions();
                  } else {
                    print(o);
                  }
                },
                visible: GlobalState.interacting,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
