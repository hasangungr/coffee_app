import '../utilities/base/base_model.dart';

class Coffee extends BaseFirebaseModel<Coffee> {
  Coffee({
    this.category,
    this.categoryId,
    this.title,
    this.backgroundImage,
  });

  final String? category;
  final String? categoryId;
  final String? title;
  final String? backgroundImage;

  @override
  Map<String, dynamic> get toJson => {
        'category': category,
        'categoryId': categoryId,
        'title': title,
        'backgroundImage': backgroundImage,
      };

  @override
  Coffee fromJson(Map<String, dynamic> json) {
    return Coffee(
      category: json['category'],
      categoryId: json['categoryId'],
      title: json['title'],
      backgroundImage: json['backgroundImage'],
    );
  }
}
