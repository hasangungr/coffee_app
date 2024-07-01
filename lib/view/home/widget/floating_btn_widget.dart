import 'package:flutter/material.dart';

import '../../../product/constants/color_constants.dart';

Widget floatingActBtn(void Function() onClick) {
  return FloatingActionButton.small(
    backgroundColor: ColorConstants.brownColor,
    onPressed: onClick,
    child: Icon(Icons.add, color: ColorConstants.white),
  );
}
