import 'package:flutter/material.dart';

import '../../../product/constants/color_constants.dart';

Widget dropDownMenu<T>({
  required void Function(T?) onSelected,
  required List<T> dataList,
  required String Function(T) labelBuilder,
}) {
  return DropdownMenu<T>(
      expandedInsets: const EdgeInsets.all(0),
      menuStyle: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(ColorConstants.white)),
      onSelected: onSelected,
      hintText: "Please Choose Product's Category",
      dropdownMenuEntries: dataList
          .map((e) => DropdownMenuEntry<T>(value: e, label: labelBuilder(e)))
          .toList());
}
