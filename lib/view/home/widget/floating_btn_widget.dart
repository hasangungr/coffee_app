// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../product/constants/color_constants.dart';

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
