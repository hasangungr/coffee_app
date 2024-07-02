// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../product/constants/color_constants.dart';



class DropdownMenuWidget<T> extends StatelessWidget {
  const DropdownMenuWidget({
    super.key,
    required this.onSelected,
    required this.dataList,
    required this.labelBuilder,
  });

  final void Function(T?) onSelected;
  final List<T> dataList;
  final String Function(T) labelBuilder;

  @override
  Widget build(BuildContext context) {
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
}
