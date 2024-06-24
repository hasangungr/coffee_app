import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension ContextExtension on BuildContext {
  EdgeInsets customPadding(double value) => EdgeInsets.all(value);
  EdgeInsets get padding8 => const EdgeInsets.all(8);
  EdgeInsets get padding16 => const EdgeInsets.all(16);

  EdgeInsets get horizontalPadding16 =>
      const EdgeInsets.symmetric(horizontal: 16);

  BorderRadius get borderRadiusCircular8 => BorderRadius.circular(8);

  Color get brownColor => const Color.fromRGBO(127, 92, 68, 1);
  Color get white => const Color.fromRGBO(255, 255, 255, 1);
  Color get silverGrey => Color.fromARGB(255, 179, 179, 179);
  Color get darkGray => Color.fromARGB(255, 86, 152, 152);

  TextStyle get brownText => TextStyle(
      color: brownColor,
      fontSize: 18,
      letterSpacing: 2,
      fontWeight: FontWeight.bold);
}
