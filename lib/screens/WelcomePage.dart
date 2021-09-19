import '../generated/l10n.dart';
import '../models/FavoriteSetting.dart';
import '../screens/LogIn.dart';
import '../screens/SignUp.dart';
import '../utils/AppColors.dart';
import '../utils/FontsStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum languages { Arabic, English }

class WelcomePage extends StatefulWidget {
  static const id = "welcome";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: PopupMenuButton<languages>(
          onSelected: (languages result) {
            Provider.of<FavoriteSetting>(context, listen: false)
                .changeLanguage(result.toString().split(".")[1]);
            setState(() {
              //  _selection = result;
              Provider.of<FavoriteSetting>(context, listen: false)
                  .changeLanguage(result.toString().split(".")[1]);
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<languages>>[
            PopupMenuItem<languages>(
              value: languages.English,
              child: Text(S.of(context).English),
            ),
            PopupMenuItem<languages>(
              value: languages.Arabic,
              child: Text(S.of(context).Arabic),
            ),
          ],
        ),
        centerTitle: true,
        title: Text(
          S.of(context).mental_health,
          style: FontsStyle.appBarStyle,
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'images/16.png',
                fit: BoxFit.fill,
                width: screenWidth * 0.7,
                height: screenHeight / 3,
              ),
              Container(
                height: 70,
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[900])),
                    onPressed: () {
                      Navigator.of(context).pushNamed(SignUp.id);
                    },
                    child: Text(S.of(context).sign_up)),
              ),
              Container(
                  height: 70,
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LogIn.id);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[900])),
                      child: Text(S.of(context).log_in)))
            ]),
      ),
    );
  }
}
