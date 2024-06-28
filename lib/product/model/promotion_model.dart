import '../utilities/base/base_model.dart';

class PromotionModel extends BaseFirebaseModel<PromotionModel> {
  PromotionModel({
    this.promotionUrl,
  });

  final String? promotionUrl;

  @override
  Map<String, dynamic> get toJson => {'promotionUrl': promotionUrl};

  @override
  PromotionModel fromJson(Map<String, dynamic> json) => PromotionModel(
        promotionUrl: json['promotionUrl'],
      );
}
