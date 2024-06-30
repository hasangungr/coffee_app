import 'package:coffee_app/product/model/category_model.dart';
import 'package:coffee_app/product/model/promotion_model.dart';
import 'package:coffee_app/product/utilities/firebase/firebase_collections.dart';
import 'package:coffee_app/product/utilities/firebase/firebase_utility.dart';
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
        // await Future.delayed(const Duration(seconds: 2)),

        await fetchPromotions(),
        await fetchCategories(),
        await fetchProducts(),

        //todo fetch products and choosen categories and fetch products
        state = state.updateState(isLoaded: true),
      };
}

class HomeState {
  bool? isLoading;
  List<PromotionModel>? promotionList;

  List<CategoryModel>? categoryList;
  List<Product>? productList;

  HomeState(
      {this.isLoading,
      this.promotionList,
      this.categoryList,
      this.productList});

  HomeState updateState({
    List<PromotionModel>? promotionList,
    List<CategoryModel>? categoryList,
    List<Product>? productList,
    bool? isLoaded,
  }) {
    return HomeState(
        promotionList: promotionList ?? this.promotionList,
        categoryList: categoryList ?? this.categoryList,
        productList: productList ?? this.productList,
        isLoading: isLoaded ?? isLoading);
  }
}
