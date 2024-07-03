import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class FloatingActBtn extends StatelessWidget {
  const FloatingActBtn({
    super.key,
    required this.onClick,
  });
  final void Function() onClick;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: ColorConstants.brownColor,
      onPressed: onClick,
      child: Icon(Icons.add, color: ColorConstants.white),
    );
  }
}
