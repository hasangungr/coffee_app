import 'package:coffee_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/custom_paddings.dart';
import '../../../product/constants/color_constants.dart';
import '../../../product/model/product_model.dart';

Container productContainerWidget(BuildContext context, Product product) {
  return Container(
    decoration: BoxDecoration(
        //todo generic
        border: Border(
            bottom: BorderSide(color: ColorConstants.brownColor),
            left: BorderSide(color: ColorConstants.brownColor),
            top: BorderSide(color: ColorConstants.brownColor)),
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(12),
        )),
    child: Row(
      children: [
        Expanded(
          child: Container(
              height: context.dynamicHeight(0.1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.productImageUrl! //todo nullable
                      // "https://firebasestorage.googleapis.com/v0/b/coffee-app-95562.appspot.com/o/latte.jpg?alt=media&token=220b25f2-8adc-492f-97ba-6abfc8811c40",
                      ),
                ),
              )),
        ),
        CustomPaddings.customPaddingSizedBoxWidth(4),
        Text(product.productName ?? ''),
        const Expanded(flex: 2, child: SizedBox()),
        Text("${product.price}\$"),
        CustomPaddings.customPaddingSizedBoxWidth(8),
      ],
    ),
  );
}
