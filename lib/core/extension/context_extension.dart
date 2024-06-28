import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicHeight(double value) =>
      MediaQuery.of(this).size.height * value; //todo null safety
  double dynamicWidth(double value) => MediaQuery.of(this).size.width * value;
}
