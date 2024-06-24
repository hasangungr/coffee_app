import '../utilities/base/base_model.dart';

class Coffees extends BaseFirebaseModel<Coffees> implements IdModel {
  Coffees({
    this.category,
    this.categoryId,
    this.title,
    this.backgroundImage,
    this.id,
  });

  final String? category;
  final String? categoryId;
  final String? title;
  final String? backgroundImage;
  @override
  final String? id;

  // Coffees copyWith({
  //   String? category,
  //   String? categoryId,
  //   String? title,
  //   String? backgroundImage,
  //   String? id,
  // }) {
  //   return Coffees(
  //     category: category ?? this.category,
  //     categoryId: categoryId ?? this.categoryId,
  //     title: title ?? this.title,
  //     backgroundImage: backgroundImage ?? this.backgroundImage,
  //     id: id ?? this.id,
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'categoryId': categoryId,
      'title': title,
      'backgroundImage': backgroundImage,
      'id': id,
    };
  }

  @override
  Coffees fromJson(Map<String, dynamic> json) {
    return Coffees(
        category: json['category'],
        categoryId: json['categoryId'],
        title: json['title'],
        backgroundImage: json['backgroundImage'],
        id: json['id']);
  }
}
