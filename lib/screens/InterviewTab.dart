//import 'package:camera/camera.dart';
import 'package:depression_treatment/screens/CameraAndBeck.dart';

import '../generated/l10n.dart';
import 'package:flutter/material.dart';

class InterviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("interview"),
        ElevatedButton(
            onPressed: () async {
              //WidgetsFlutterBinding.ensureInitialized();
              //CameraAndBeck.cameras = await availableCameras();
              Navigator.of(context).pushNamed(CameraAndBeck.id);
            },
            child: Text("Start Interview"))
      ],
    );
  }
}
