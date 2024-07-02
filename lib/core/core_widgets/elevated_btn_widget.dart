import 'package:coffee_app/core/extension/context_extension.dart';
import 'package:coffee_app/product/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ElevatedBtnWidget extends StatelessWidget {
  const ElevatedBtnWidget({super.key, this.onTap, this.title, this.icon});
  final void Function()? onTap;
  final String? title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: title != null
            ? Text(title!,
                style: context.appTextTheme.labelLarge
                    ?.copyWith(color: ColorConstants.white))
            : Icon(icon));
  }
}
