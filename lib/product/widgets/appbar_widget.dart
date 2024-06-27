import 'package:coffee_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

AppBar appbar(BuildContext context) {
  return AppBar(
      backgroundColor: context.brownColor,
      centerTitle: true,
      title: Text(
        "Coffee app",
        style: TextStyle(color: context.white, fontFamily: "PlaywriteNZ"),
      ));
}
