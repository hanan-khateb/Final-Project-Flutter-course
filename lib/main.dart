import 'package:depression_treatment/TestConn.dart';

import 'screens/HomePage.dart';
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
        HomePage.id: (context) => HomePage(),
         TestConn.id: (context) => TestConn(),

      },
    );
  }
}
