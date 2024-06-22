import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension ContextExtension on BuildContext {
  EdgeInsets customPadding(double value) => EdgeInsets.all(value);
  EdgeInsets get padding8 => const EdgeInsets.all(8);
  EdgeInsets get padding16 => const EdgeInsets.all(16);
}
