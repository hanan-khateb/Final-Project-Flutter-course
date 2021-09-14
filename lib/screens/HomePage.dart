import '../generated/l10n.dart';
import '../utils/AppColors.dart';
import '../utils/FontsStyle.dart';
import '../weidgets/WelcomeContent.dart';
import '../weidgets/MyDrawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const id = "homepage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).mental_health,
          style: FontsStyle.appBarStyle,
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      drawer: MyDrawer(),
      body: ListView(scrollDirection: Axis.horizontal, children: [
        WelcomeContent(
          imageName: "50",
          welcomeNumber: 1,
        ),
        WelcomeContent(
          imageName: "56",
          welcomeNumber: 2,
        ),
        WelcomeContent(
          imageName: "53",
          welcomeNumber: 3,
        ),
        WelcomeContent(
          imageName: "54",
          welcomeNumber: 4,
        ),
        WelcomeContent(
          imageName: "51",
          welcomeNumber: 5,
        ),
        WelcomeContent(
          imageName: "55",
          welcomeNumber: 6,
        ),
      ]),
    );
  }
}
