import 'dart:async';

import 'package:depression_treatment/screens/IntroPage.dart';

import '../models/FavoriteSetting.dart';
import '../generated/l10n.dart';
import '../utils/FontsStyle.dart';
import '../screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AppSplashScreen extends StatefulWidget {
  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> {
  Timer viewTime;
  int timeValue = 5;
  @override
  void initState() {
    super.initState();
    viewTime = new Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (timeValue == 0) {
        t.cancel();
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(IntroPage.id);
      } else {
        timeValue--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double w, h;
    double screenWidth, screenHeight;

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
          color: Colors.white,
          width: screenWidth * 0.8,
          height: screenHeight * 0.5,
          child: LayoutBuilder(
            builder: (builder, sizes) {
              w = sizes.maxWidth;
              h = sizes.maxHeight;
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/7.JPG',
                      width: w,
                      height: h * 0.65,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: w,
                      child: TextLiquidFill(
                        text: S.of(context).mental_health,
                        waveColor: Colors.blue[700],
                        loadDuration: Duration(seconds: 4),
                        textStyle: FontsStyle.splashStyle(w, h * 0.3),
                        boxBackgroundColor: Colors.white,
                        boxHeight: h * 0.3,
                      ),
                    )
                  ]);
            },
          ),
        )));

    /*AnimatedSplashScreen(
          splashIconSize:
              screenWidth < screenHeight ? screenWidth * 0.8 : screenHeight * 08,
          splash: LayoutBuilder(
            builder: (builder, sizes) {
              w = sizes.maxWidth;
              h = sizes.maxHeight;
              return Container(
                  width: w,
                  height: h,
                  color: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/7.JPG',
                          width: w * 0.7,
                          height: h * 0.7,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: w * 0.7,
                          child: TextLiquidFill(
                            text: S.of(context).mental_health,
                            waveColor: Colors.blue[700],
                            loadDuration: Duration(seconds: 4),
                            textStyle: FontsStyle.splashStyle(w * 0.7, h * 0.3),
                            boxBackgroundColor: Colors.white,
                            boxHeight: h * 0.3,
                          ),
                        )
                      ]));
            },
          ),
          nextScreen: HomePage(),
          duration: 5000,
      );*/
  }
}
