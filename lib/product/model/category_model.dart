import 'package:coffee_app/product/utilities/base/base_model.dart';

class CategoryModel extends BaseFirebaseModel<CategoryModel> {
  CategoryModel({
    this.categoryName,
    String? id,
  }) : super(id);

  final String? categoryName;

  @override
  Map<String, dynamic> get toJson => {
        'name': categoryName,
        'id': id,
      };

  @override
  CategoryModel fromJson(Map<String, dynamic> json) => CategoryModel(
        categoryName: json['name'],
        id: json['id'],
      );
}
