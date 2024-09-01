import 'package:flutter/material.dart';

class AppTheme {
  static const Color blueColor = Color(0xFF004C73);
  static const Color yellowColor = Color(0xFFF8CD3A);
  static const Color darkGreyColor = Color(0xFF868E96);
  static const Color lightGreyColor = Color(0xFFE4DFDA);
  static const Color greenColor = Color(0xFF86EC84);
  static const Color redColor = Color(0xFFF1675C);
  static const Color purpleColor = Color(0xFF823EF9);
  static const Color lightPurpleColor = Color(0xFFE8E3FB);
  static const Color ghostWhiteColor = Color(0xFFF9F8FF);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color lightBlackColor = Color(0xFF495057);
  static const Color backgroundColor = Color(0xFFF0F1F9);

  static ThemeData buildTheme() {
    final baseData = ThemeData.light();
    final dividerTheme =
        baseData.dividerTheme.copyWith(color: lightPurpleColor, thickness: 1);

    return baseData.copyWith(
      primaryColor: yellowColor,
      dividerTheme: dividerTheme,
      // backgroundColor: whiteColor,
      scaffoldBackgroundColor: whiteColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: blueColor),
    );
  }
}
