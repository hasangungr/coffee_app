import 'package:coffee_app/product/model/category_model.dart';
import 'package:coffee_app/product/model/promotion_model.dart';
import 'package:coffee_app/product/utilities/firebase/firebase_collections.dart';
import 'package:coffee_app/product/utilities/firebase/firebase_utility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Future<void> fetchAndLoad() async => {
        state = state.updateState(isLoaded: false),
        await Future.delayed(const Duration(seconds: 2)),
        await fetchPromotions(),
        await fetchCategories(),
        state = state.updateState(isLoaded: true),
      };
}

class HomeState {
  final List<PromotionModel>? promotionList;
  bool? isLoading;
  List<CategoryModel>? categoryList;

  HomeState({this.promotionList, this.isLoading, this.categoryList});

  HomeState updateState({
    List<PromotionModel>? promotionList,
    List<CategoryModel>? categoryList,
    bool? isLoaded,
  }) {
    return HomeState(
        promotionList: promotionList ?? this.promotionList,
        categoryList: categoryList ?? this.categoryList,
        isLoading: isLoaded ?? isLoading);
  }
}
