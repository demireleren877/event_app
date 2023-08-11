import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color blueButton = Color(0xFF5468FF);
const Color blueText = Color(0xFF4D60E7);

const Color grayText = Color(0xFF5D5F65);
const Color whiteText = Color(0xFFEDEEEF);

const Color white = Color(0xFFFFFFFF);
const Color black = Color(0xFF000000);

const Color blackBG = Color(0xFF181A20);
const Color blackTextFild = Color(0xFF262A34);

const List<Color> gradient = [
  Color.fromRGBO(24, 26, 32, 1),
  Color.fromRGBO(24, 26, 32, 0.9),
  Color.fromRGBO(24, 26, 32, 0.8),
  Color.fromRGBO(24, 26, 32, 0.7),
  Color.fromRGBO(24, 26, 32, 0.6),
  Color.fromRGBO(24, 26, 32, 0.5),
  Color.fromRGBO(24, 26, 32, 0.4),
  Color.fromRGBO(24, 26, 32, 0.0),
];

class Stlyes {
  static ThemeData themeData() {
    return ThemeData(
      fontFamily: 'SF Pro',
      primarySwatch: Colors.blue,
    );
  }
}

const TextStyle headline = TextStyle(
  fontSize: 28,
  color: whiteText,
  fontWeight: FontWeight.bold,
);

const TextStyle headlineDot = TextStyle(
  fontSize: 30,
  color: blueText,
  fontWeight: FontWeight.bold,
);
const TextStyle headline1 = TextStyle(
  fontSize: 24,
  color: whiteText,
  fontWeight: FontWeight.bold,
);

const TextStyle headline2 = TextStyle(
  fontSize: 14,
  color: whiteText,
  fontWeight: FontWeight.w600,
);
const TextStyle headline3 = TextStyle(
  fontSize: 14,
  color: grayText,
  fontWeight: FontWeight.bold,
);
TextStyle hintStyle = TextStyle(
  fontSize: 12.sp,
  color: grayText,
  fontWeight: FontWeight.bold,
);
