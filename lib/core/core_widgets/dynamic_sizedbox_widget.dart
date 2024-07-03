import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:coffee_app/core/extension/context_extension.dart';

class DynamicSizedBox extends StatelessWidget {
  const DynamicSizedBox({
    super.key,
    required this.heightValue,
    required this.child,
  });

  final double heightValue;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: context.dynamicHeight(heightValue), child: child);
  }
}
