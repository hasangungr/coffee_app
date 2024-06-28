import 'package:coffee_app/product/utilities/base/base_model.dart';

class CategoryModel extends BaseFirebaseModel<CategoryModel> {
  CategoryModel({
    this.categoryName,
  });

  final String? categoryName;

  @override
  Map<String, dynamic> get toJson => {'name': categoryName};

  @override
  CategoryModel fromJson(Map<String, dynamic> json) => CategoryModel(
        categoryName: json['name'],
      );
}
