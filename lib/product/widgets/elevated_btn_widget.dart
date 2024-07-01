import 'package:coffee_app/core/extension/context_extension.dart';
import 'package:coffee_app/product/constants/color_constants.dart';
import 'package:flutter/material.dart';

Widget elevatedBtnWidget(
    {required void Function()? onTap,
    String? title,
    IconData? icon,
    required BuildContext context}) {
  return ElevatedButton(
      onPressed: onTap,
      child: title != null
          ? Text(title,
              style: context.appTextTheme.labelLarge
                  ?.copyWith(color: ColorConstants.white))
          : Icon(icon));
}
