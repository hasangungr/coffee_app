// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coffee_app/product/model/product_model.dart';
import 'package:coffee_app/product/utilities/firebase/firebase_utility.dart';

import '../../product/model/category_model.dart';
import '../home/home_view.dart';

class ProductAddManager with FirebaseUtility {
  ProductAddManager(this.ref);

  final WidgetRef ref;

  Product? product;
  List<CategoryModel>? categoryList;

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  void addProduct(Product product) {}

  void fetchCategory() {
    final state = ref.watch(homeProvider);
    categoryList = state.categoryList;
  }

  void dispose() {
    productNameController.dispose();
    priceController.dispose();
    stockController.dispose();
    product = null;
  }
}
