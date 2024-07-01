import 'package:coffee_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget dynamicSizedBox(BuildContext context,
        {required double heightValue, required Widget child}) =>
    SizedBox(
        height: context.dynamicHeight(heightValue), //todo context ???
        child: child);
