import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

final appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: ColorConstants.brownColor,
    centerTitle: true,
    iconTheme: IconThemeData(color: ColorConstants.white),
  ),
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        overlayColor: WidgetStateProperty.all<Color>(Colors.black12),
        backgroundColor: WidgetStatePropertyAll(ColorConstants.brownColor)),
  ),
  scaffoldBackgroundColor: ColorConstants.white,
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
    foregroundColor: WidgetStateProperty.all<Color>(ColorConstants.brownColor),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          WidgetStateProperty.all<Color>(ColorConstants.brownColor),
      foregroundColor: WidgetStateProperty.all<Color>(ColorConstants.white),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: ColorConstants.brownColor),
    hintStyle: TextStyle(color: ColorConstants.brownColor),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: ColorConstants.brownColor)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
