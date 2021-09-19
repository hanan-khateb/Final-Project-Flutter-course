import '../generated/l10n.dart';
import '../models/FavoriteSetting.dart';
import '../utils/FontsStyle.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class IntroContent extends StatelessWidget {
  String imageName;
  int welcomeNumber;
  double screenWidth, screenHeight;
  IntroContent({this.imageName, this.welcomeNumber});
  @override
  Widget build(BuildContext context) {
    Map<int, dynamic> welcome = {
      1: S.of(context).welcome1,
      2: S.of(context).welcome2,
      3: S.of(context).welcome3,
      4: S.of(context).welcome4,
      5: S.of(context).welcome5,
      6: S.of(context).welcome6,
    };
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: screenWidth,
          padding: EdgeInsets.all(15),
          child: Text(
            welcome[welcomeNumber],
            softWrap: true,
            textDirection:
                Provider.of<FavoriteSetting>(context).language == "Arabic"
                    ? TextDirection.rtl
                    : TextDirection.ltr,
            style: FontsStyle.wellcomeStyle(screenWidth - 40, screenHeight / 3),
          ),
        ),
        Image.asset(
          "images/welcome/$imageName.jpg",
          width: screenWidth - 80,
          height: screenHeight / 2 - 70,
          fit: BoxFit.fill,
        )
      ],
    );
  }
}
