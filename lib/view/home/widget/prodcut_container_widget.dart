// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:coffee_app/core/extension/context_extension.dart';

import '../../../core/core_widgets/custom_paddings.dart';
import '../../../product/constants/color_constants.dart';
import '../../../product/model/product_model.dart';

class ProductContainerWidget extends StatelessWidget {
  const ProductContainerWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
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
}
