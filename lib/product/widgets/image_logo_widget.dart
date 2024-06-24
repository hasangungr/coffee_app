import 'package:flutter/material.dart';

import '../constants/image_constants.dart';

@immutable
abstract class CustomWidget {
  const CustomWidget._();
  static Image get imageLogoWidget => Image.asset(ImageConstants.logoUrl);
}
