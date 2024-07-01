import 'package:flutter/material.dart';

import '../../../product/constants/color_constants.dart';
import '../../../product/constants/textstyle_constants.dart';
import '../../../product/model/category_model.dart';

Widget categoryChipWidget({
  required CategoryModel category,
  required void Function() onClick,
  required bool isActive,
}) {
  return InkWell(
    onTap: onClick,
    child: Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Chip(
        labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
        color: WidgetStatePropertyAll(
            isActive ? ColorConstants.brownColor : ColorConstants.silverGrey),
        label: Text(
          category.categoryName ?? '',
          style: TextStyleConstants.whiteText14.copyWith(
              color: isActive ? ColorConstants.white : ColorConstants.black),
        ),
      ),
    ),
  );
}
