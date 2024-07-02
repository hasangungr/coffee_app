import 'package:flutter/material.dart';

abstract class CustomPaddings {
  CustomPaddings._();

  static Padding customPadding(double value, {Widget? child}) =>
      Padding(padding: EdgeInsets.all(value), child: child);
  static SizedBox customPaddingSizedBoxWidth(double value) =>
      SizedBox(width: value);
  static SizedBox customPaddingSizedBoxHeight(double value) =>
      SizedBox(height: value);
  static Expanded customPaddingExpanded({int? flex}) =>
      Expanded(flex: flex ?? 1, child: const SizedBox());

  static EdgeInsets get padding8 => const EdgeInsets.all(8);
  static EdgeInsets get padding16 => const EdgeInsets.all(16);
  static EdgeInsets get paddingOnlyLeft16 => const EdgeInsets.only(left: 16);

  static EdgeInsets get horizontalPadding16 =>
      const EdgeInsets.symmetric(horizontal: 16);
}
