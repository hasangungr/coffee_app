import 'package:coffee_app/product/model/promotion_model.dart';
import 'package:flutter/material.dart';

 
class PromotionContainerWidget extends StatelessWidget {
  const PromotionContainerWidget({super.key, required this.promotion});

  final PromotionModel promotion;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(promotion.promotionUrl!
              // "https://firebasestorage.googleapis.com/v0/b/coffee-app-95562.appspot.com/o/promotion-1.jpg?alt=media&token=21cce213-a7d5-451f-a05c-17b0ed3610dc",
              ),
        ),
      )),
    );
  }
}
