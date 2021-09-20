import 'package:depression_treatment/utils/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FontsStyle {
  static TextStyle splashStyle(double w, double h) {
    double fonteSize = w < h ? w * 0.3 : h * 0.3;
    return TextStyle(fontSize: fonteSize, fontWeight: FontWeight.bold);
  }

  static TextStyle wellcomeStyle(double w, double h) {
    double fonteSize = w < h ? w * 0.09 : h * 0.09;
    return TextStyle(
        fontSize: fonteSize,
        color: Colors.blue[900],
        fontWeight: FontWeight.bold,
        fontFamily: "Merienda");
  }

  static final appBarStyle =
      TextStyle(fontWeight: FontWeight.bold, fontFamily: "Merienda");
  static final introAction = TextStyle(
      color: AppColors.introText, fontSize: 20, fontFamily: "Merienda");

  static final mainStyle =
      TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Merienda");
}
