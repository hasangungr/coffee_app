import 'dart:typed_data';

import 'package:coffee_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../product/constants/color_constants.dart';

Widget imgPickerWidget(
    {required BuildContext context,
    Uint8List? selectedImg,
    void Function()? onClick}) {
  return InkWell(
      onTap: onClick,
      child: Container(
        height: context.dynamicHeight(0.2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorConstants.black),
        ),
        child: selectedImg != null
            ? Image.memory(selectedImg)
            : const Icon(Icons.add_a_photo_outlined),
      ));
}
