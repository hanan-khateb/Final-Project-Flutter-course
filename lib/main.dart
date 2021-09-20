import 'screens/OneArticleInformation.dart';

import 'TestConn.dart';
import 'screens/CameraAndBeck.dart';
import 'screens/HomePage.dart';
import 'screens/IntroPage.dart';
import 'screens/SignUpSecond.dart';
import 'screens/WelcomePage.dart';
import 'screens/LogIn.dart';
import 'screens/SignUp.dart';
import 'models/FavoriteSetting.dart';
import 'screens/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FavoriteSetting()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: AppSplashScreen(),
      title: "Depression Treatment",
      routes: {
        SignUp.id: (context) => SignUp(),
        LogIn.id: (context) => LogIn(),
        IntroPage.id: (context) => IntroPage(),
        HomePage.id: (context) => HomePage(),
        WelcomePage.id: (context) => WelcomePage(),
        SignUpSecond.id: (context) => SignUpSecond(),
        CameraAndBeck.id: (context) => CameraAndBeck(),
        OneArticleInformation.id: (context) => OneArticleInformation(),
        TestConn.id: (context) => TestConn(),
      },
    );
  }
}
