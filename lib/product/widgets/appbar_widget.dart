 import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

AppBar appbar(BuildContext context) {
  return AppBar(
      backgroundColor: ColorConstants.brownColor,
      centerTitle: true,
      title: Text(
        "Coffee app",
        style: TextStyle(color: ColorConstants.white, fontFamily: "PlaywriteNZ"),
      ));
}
