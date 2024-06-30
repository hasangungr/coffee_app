import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

AppBar appbar(BuildContext context) {
  return AppBar(
    title: Text("Coffee app",
        style:
            TextStyle(color: ColorConstants.white, fontFamily: "PlaywriteNZ")),
  );
}
