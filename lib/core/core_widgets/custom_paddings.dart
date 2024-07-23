import 'package:flutter/material.dart';

final class CustomPaddings {
  const CustomPaddings._();

  static Padding customPadding(double value, {Widget? child}) =>
      Padding(padding: EdgeInsets.all(value), child: child);
}

@immutable
final class ConstEdgeInsets extends EdgeInsets {
  const ConstEdgeInsets.padding16() : super.all(16);
  const ConstEdgeInsets.padding8() : super.all(8);
  const ConstEdgeInsets.horizontalPadding16() : super.all(16);
}

@immutable
final class CustomSizedBox extends SizedBox {
  const CustomSizedBox.paddingHeight({super.key, required double heightValue})
      : super(height: heightValue);
  const CustomSizedBox.paddingWidth({super.key, required double widthValue})
      : super(height: widthValue);
}

@immutable
final class CustomExpanded extends Expanded {
  const CustomExpanded({super.key, super.flex, Widget? child})
      : super(child: child ?? const SizedBox());
}
