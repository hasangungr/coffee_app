import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:coffee_app/core/extension/context_extension.dart';

import '../../../product/constants/color_constants.dart';

class ImgPickerWidget extends StatelessWidget {
  const ImgPickerWidget({
    super.key,
    this.selectedImg,
    this.onClick,
  });

  final Uint8List? selectedImg;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClick,
        child: Container(
          height: context.dynamicHeight(0.2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorConstants.black),
          ),
          child: selectedImg != null
              ? Image.memory(
                  selectedImg!,
                  fit: BoxFit.cover,
                )
              : const Icon(Icons.add_a_photo_outlined),
        ));
  }
}
