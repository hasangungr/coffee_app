import 'package:coffee_app/product/constants/color_constants.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TextStyleConstants {
  const TextStyleConstants._();
  static TextStyle get whiteText14 => const TextStyle(
      fontSize: 14, letterSpacing: 2, fontWeight: FontWeight.w400);
  static TextStyle get brownText18 => TextStyle(
      color: ColorConstants.brownColor,
      fontSize: 18,
      letterSpacing: 2,
      fontWeight: FontWeight.bold);
}
