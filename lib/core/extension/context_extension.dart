import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension ContextExtension on BuildContext {
  BorderRadius get borderRadiusCircular8 => BorderRadius.circular(8);

  Color get brownColor => const Color.fromRGBO(127, 92, 68, 1);
  Color get white => const Color.fromRGBO(255, 255, 255, 1);
  Color get silverGrey => const Color.fromARGB(255, 179, 179, 179);
  Color get darkGray => const Color.fromARGB(255, 86, 152, 152);

  double dynamicHeight(double value) =>
      MediaQuery.of(this).size.height * value; //todo null safety
  double dynamicWidth(double value) => MediaQuery.of(this).size.width * value;

  TextStyle get brownText => TextStyle(
      color: brownColor,
      fontSize: 18,
      letterSpacing: 2,
      fontWeight: FontWeight.bold);
}
