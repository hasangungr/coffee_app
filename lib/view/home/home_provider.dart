import 'package:coffee_app/product/model/category_model.dart';
import 'package:coffee_app/product/model/promotion_model.dart';
import 'package:coffee_app/product/utilities/firebase/firebase_collections.dart';
import 'package:coffee_app/product/utilities/firebase/firebase_utility.dart';
  import 'package:flutter/material.dart';

import '../../product/model/product_model.dart';

class HomeProvider extends ChangeNotifier with FirebaseUtility {
  HomeProvider() {
    debugPrint("home provider init");
    fetchAndLoad();
  }

  bool? isLoading;

  List<PromotionModel>? promotionList;
  List<CategoryModel>? categoryList;
  List<Product>? productList;
  List<Product>? filteredList;

  String? choosenCategoryId;
  Future<void> fetchPromotions() async {
    promotionList =
        await fetchList(PromotionModel(), FirebaseCollections.promotions);
  }

  Future<void> fetchCategories() async {

     categoryList =
        await fetchList(CategoryModel(), FirebaseCollections.categories);
  }

  Future<void> fetchProducts() async {
    productList = await fetchList(Product(), FirebaseCollections.products);
  }

  void changeChoosenCategory(String id) {
    choosenCategoryId = id;
    filteredList = productList!.where((e) => e.categoryId == id).toList();
    debugPrint("change");
    notifyListeners();
  }

  Future<void> fetchAndLoad() async {
    isLoading = false;
    await fetchPromotions();
    await fetchCategories();
    await fetchProducts();
    await Future.delayed(const Duration(seconds: 1));

    choosenCategoryId = categoryList?[0].id;
    filteredList =
        productList!.where((e) => e.categoryId == categoryList?[0].id).toList();

    isLoading = true;

    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();

    debugPrint("home provider dispose");
  }
}
