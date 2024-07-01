import 'package:flutter/material.dart';
import 'package:coffee_app/core/extension/string_extension.dart';

Widget textFormFieldWidget(
    {String? hint,
    required bool isNullValid,
    required TextEditingController controller}) {
  return TextFormField(
      controller: controller,
      validator:
          isNullValid == true ? (value) => value?.isNullValidation : null,
      decoration: InputDecoration(hintText: hint));
}

Widget numberTextFormFieldWidget(
    {String? hint,
    required bool isNullValid,
    required TextEditingController controller}) {
  return TextFormField(
      controller: controller,
      validator:
          isNullValid == true ? (value) => value?.isDoubleValidation : null,
      decoration: InputDecoration(hintText: hint));
}
