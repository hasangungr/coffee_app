import 'package:flutter/material.dart';

import 'base_model.dart';

@immutable
class PromotionModel extends BaseFirebaseModel<PromotionModel> {
  const PromotionModel({
    this.promotionUrl,
    final String? id,
  }) : super(id);

  final String? promotionUrl;

  @override
  Map<String, dynamic> get toJson => {'promotionUrl': promotionUrl, 'id': id};

  @override
  PromotionModel fromJson(Map<String, dynamic> json) => PromotionModel(
        promotionUrl: json['promotionUrl'],
        id: json['id'],
      );
}
