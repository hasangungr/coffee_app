import 'package:coffee_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/core_widgets/custom_paddings.dart';
import '../../../product/constants/color_constants.dart';
import '../../../product/model/product_model.dart';

Widget productContainerWidget(BuildContext context, Product product) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: ColorConstants.brownColor),
            left: BorderSide(color: ColorConstants.brownColor),
            top: BorderSide(color: ColorConstants.brownColor)),
        borderRadius:
            const BorderRadius.horizontal(left: Radius.circular(12))),
    child: Row(
      children: [
        Container(
            height: context.dynamicHeight(0.1),
            width: context.dynamicHeight(0.1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              image: product.productImageUrl != null
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product.productImageUrl!),
                    )
                  : null,
            )),
        CustomPaddings.customPaddingSizedBoxWidth(12),
        Text(product.productName ?? ''),
        const Expanded(flex: 2, child: SizedBox()),
        Text("${product.price}\$"),
        CustomPaddings.customPaddingSizedBoxWidth(8),
      ],
    ),
  );
}
