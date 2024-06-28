import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

//todo animation progress
Widget get circularProgressWidget => Container(
    alignment: Alignment.center,
    color: ColorConstants.brownColor,
    child: CircularProgressIndicator(color: ColorConstants.white));
