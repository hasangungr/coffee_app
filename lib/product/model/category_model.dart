import 'package:coffee_app/product/model/base_model.dart';
import 'package:flutter/material.dart';

@immutable
class CategoryModel extends BaseFirebaseModel<CategoryModel> {
  const CategoryModel({
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
