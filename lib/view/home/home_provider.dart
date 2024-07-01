import 'package:coffee_app/product/model/category_model.dart';
import 'package:coffee_app/product/model/promotion_model.dart';
import 'package:coffee_app/product/utilities/firebase/firebase_collections.dart';
import 'package:coffee_app/product/utilities/firebase/firebase_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/model/product_model.dart';

class HomeProvider extends StateNotifier<HomeState> with FirebaseUtility {
  HomeProvider() : super(HomeState());

  Future<void> fetchPromotions() async {
    state = state.updateState(
        promotionList:
            await fetchList(PromotionModel(), FirebaseCollections.promotions));
  }

  Future<void> fetchCategories() async {
    state = state.updateState(
        categoryList:
            await fetchList(CategoryModel(), FirebaseCollections.categories));
  }

  Future<void> fetchProducts() async {
    state = state.updateState(
        productList: await fetchList(Product(), FirebaseCollections.products));
  }

  Future<void> get fetchAndLoad async => {
        state = state.updateState(isLoaded: false),
        //  await Future.delayed(const Duration(seconds: 5)),

        await fetchPromotions(),
        await fetchCategories(),
        await fetchProducts(),

        state = state.updateState(
          isLoaded: true,
          choosenCategoryId: state.categoryList?[0].id,
          filteredList: state.productList!
              .where((e) => e.categoryId == state.categoryList?[0].id)
              .toList(),
        ),
      };

  void changeChoosenCategory(String id) {
    state = state.updateState(
      choosenCategoryId: id,
      filteredList:
          state.productList!.where((e) => e.categoryId == id).toList(),
    );
    debugPrint(state.choosenCategoryId);
  }
}

class HomeState {
  bool? isLoading;

  List<PromotionModel>? promotionList;
  List<CategoryModel>? categoryList;
  List<Product>? productList;
  List<Product>? filteredList;

  String? choosenCategoryId;

  HomeState({
    this.isLoading,
    this.promotionList,
    this.categoryList,
    this.productList,
    this.choosenCategoryId,
    this.filteredList,
  });

  HomeState updateState({
    List<PromotionModel>? promotionList,
    List<CategoryModel>? categoryList,
    List<Product>? productList,
    bool? isLoaded,
    String? choosenCategoryId,
    List<Product>? filteredList,
  }) {
    return HomeState(
      promotionList: promotionList ?? this.promotionList,
      categoryList: categoryList ?? this.categoryList,
      productList: productList ?? this.productList,
      filteredList: filteredList ?? this.filteredList,
      isLoading: isLoaded ?? isLoading,
      choosenCategoryId: choosenCategoryId ?? this.choosenCategoryId,
    );
  }
}
