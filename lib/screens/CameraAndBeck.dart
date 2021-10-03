import 'package:camerawesome/models/orientations.dart';
import 'package:depression_treatment/generated/l10n.dart';
import 'package:depression_treatment/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camerawesome/camerawesome_plugin.dart';

class CameraAndBeck extends StatefulWidget {
  static const id = "CameraAndBeck";

  @override
  _CameraAndBeckState createState() => _CameraAndBeckState();
}

int questionNumber = 1;
int SelectedChoise = 0;
Map<int, List> questions;

class _CameraAndBeckState extends State<CameraAndBeck>
    with TickerProviderStateMixin {
  // Notifiers
  ValueNotifier<CameraFlashes> _switchFlash = ValueNotifier(CameraFlashes.NONE);
  ValueNotifier<Sensors> _sensor = ValueNotifier(Sensors.BACK);
  ValueNotifier<CaptureModes> _captureMode = ValueNotifier(CaptureModes.VIDEO);
  ValueNotifier<Size> _photoSize = ValueNotifier(null);

  // Controllers
  PictureController _pictureController = new PictureController();
  VideoController _videoController = new VideoController();
  @override
  Widget build(BuildContext context) {
    questions = {
      1: [
        S.of(context).b1b1,
        S.of(context).b1b2,
        S.of(context).b1b3,
        S.of(context).b1b4
      ],
      2: [
        S.of(context).b2b1,
        S.of(context).b2b2,
        S.of(context).b2b3,
        S.of(context).b2b4
      ],
      3: [
        S.of(context).b3b1,
        S.of(context).b3b2,
        S.of(context).b3b3,
        S.of(context).b3b4
      ],
      4: [
        S.of(context).b4b1,
        S.of(context).b4b2,
        S.of(context).b4b3,
        S.of(context).b4b4
      ],
      5: [
        S.of(context).b5b1,
        S.of(context).b5b2,
        S.of(context).b5b3,
        S.of(context).b5b4
      ],
      6: [
        S.of(context).b6b1,
        S.of(context).b6b2,
        S.of(context).b6b3,
        S.of(context).b6b4
      ],
      7: [
        S.of(context).b7b1,
        S.of(context).b7b2,
        S.of(context).b7b3,
        S.of(context).b7b4
      ],
      8: [
        S.of(context).b8b1,
        S.of(context).b8b2,
        S.of(context).b8b3,
        S.of(context).b8b4
      ],
      9: [
        S.of(context).b9b1,
        S.of(context).b9b2,
        S.of(context).b9b3,
        S.of(context).b9b4
      ],
      10: [
        S.of(context).b10b1,
        S.of(context).b10b2,
        S.of(context).b10b3,
        S.of(context).b10b4
      ],
      11: [
        S.of(context).b11b1,
        S.of(context).b11b2,
        S.of(context).b11b3,
        S.of(context).b11b4
      ],
      12: [
        S.of(context).b12b1,
        S.of(context).b12b2,
        S.of(context).b12b3,
        S.of(context).b12b4
      ],
      13: [
        S.of(context).b13b1,
        S.of(context).b13b2,
        S.of(context).b13b3,
        S.of(context).b13b4
      ],
      14: [
        S.of(context).b14b1,
        S.of(context).b14b2,
        S.of(context).b14b3,
        S.of(context).b14b4
      ],
      15: [
        S.of(context).b15b1,
        S.of(context).b15b2,
        S.of(context).b15b3,
        S.of(context).b15b4
      ],
      16: [
        S.of(context).b16b1,
        S.of(context).b16b2,
        S.of(context).b16b3,
        S.of(context).b16b4
      ],
      17: [
        S.of(context).b17b1,
        S.of(context).b17b2,
        S.of(context).b17b3,
        S.of(context).b17b4
      ],
      18: [
        S.of(context).b18b1,
        S.of(context).b18b2,
        S.of(context).b18b3,
        S.of(context).b18b4
      ],
      19: [
        S.of(context).b19b1,
        S.of(context).b19b2,
        S.of(context).b19b3,
        S.of(context).b19b4
      ],
      20: [
        S.of(context).b20b1,
        S.of(context).b20b2,
        S.of(context).b20b3,
        S.of(context).b20b4
      ],
      21: [
        S.of(context).b21b1,
        S.of(context).b21b2,
        S.of(context).b21b3,
        S.of(context).b21b4
      ],
    };
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height / 2;
    return Scaffold(
        body: SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: CameraAwesome(
                testMode: false,
                onPermissionsResult: (bool result) {},
                selectDefaultSize: (List<Size> availableSizes) => Size(w, h),
                onCameraStarted: () {},
                onOrientationChanged: (CameraOrientations newOrientation) {},
                // zoom: 0.64,
                sensor: _sensor,
                photoSize: _photoSize,
                switchFlashMode: _switchFlash,
                captureMode: _captureMode,
                // orientation: DeviceOrientation.portraitUp,
                fitted: true,
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: Text(questions[questionNumber][0]),
                  leading: Radio(
                    value: 0,
                    groupValue: SelectedChoise,
                    onChanged: (value) {
                      setState(() {
                        SelectedChoise = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(questions[questionNumber][1]),
                  leading: Radio(
                    value: 1,
                    groupValue: SelectedChoise,
                    onChanged: (value) {
                      setState(() {
                        SelectedChoise = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(questions[questionNumber][2]),
                  leading: Radio(
                    value: 2,
                    groupValue: SelectedChoise,
                    onChanged: (value) {
                      setState(() {
                        SelectedChoise = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(questions[questionNumber][3]),
                  leading: Radio(
                    value: 3,
                    groupValue: SelectedChoise,
                    onChanged: (value) {
                      setState(() {
                        SelectedChoise = value;
                      });
                    },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    child: Text(S.of(context).next),
                    onPressed: () {
                      setState(() {
                        if (questionNumber < 21) {
                          questionNumber = questionNumber + 1;
                        } // else {}
                      });
                    }),
                TextButton(
                    child: Text(S.of(context).cancel),
                    onPressed: () {
                      Navigator.of(context).pushNamed(HomePage.id);
                    })
              ],
            )
          ]),
    ));
  }
}
