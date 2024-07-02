import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/color_constants.dart';

Widget get circularProgressWidget => Container(
    padding: const EdgeInsets.all(75),
    alignment: Alignment.center,
    color: ColorConstants.white,
    child: Lottie.network(
        "https://lottie.host/289125cd-70d5-4ba2-becf-160530d5cd8d/LIfN4dL9DV.json"));
