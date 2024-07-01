import 'base_model.dart';

class PromotionModel extends BaseFirebaseModel<PromotionModel> {
  PromotionModel({
    this.promotionUrl,
    String? id,
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
