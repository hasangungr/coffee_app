import 'package:flutter/material.dart';

@immutable
abstract class ColorConstants {
  const ColorConstants._();
  static Color get brownColor => const Color.fromRGBO(127, 92, 68, 1);
  static Color get white => const Color.fromRGBO(255, 255, 255, 1);
  static Color get silverGrey => const Color.fromARGB(255, 179, 179, 179);
  static Color get darkGray => const Color.fromARGB(255, 86, 152, 152);
  static Color get black => const Color.fromARGB(130, 0, 0, 0);
 
}
