import 'package:flutter/cupertino.dart';

class CameraAndBeck extends StatelessWidget {
  static const id = "CameraAndBeck";

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



/*import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraAndBeck extends StatefulWidget {
  //static List<CameraDescription> cameras;
  static const id = "CameraAndBeck";

  @override
  _CameraAndBeckState createState() => _CameraAndBeckState();
}

class _CameraAndBeckState extends State<CameraAndBeck> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller =
        CameraController(CameraAndBeck.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
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
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: CameraPreview(controller),
    );
  }
}
*/