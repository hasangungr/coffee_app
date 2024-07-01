import 'package:coffee_app/view/home/widget/floating_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/core_widgets/custom_paddings.dart';
import '../../product/route/app_route.dart';
import 'home_provider.dart';
import 'widget/dynamic_sizedbox_widget.dart';
import 'widget/prodcut_container_widget.dart';
import 'widget/promotion_container_widget.dart';

import '../../product/model/category_model.dart';
import '../../product/model/product_model.dart';
import '../../product/model/promotion_model.dart';
import '../../product/app_widgets/appbar_widget.dart';
import '../../product/app_widgets/circular_progress_widget.dart';
import 'widget/category_chip_widget.dart';

final homeProvider =
    StateNotifierProvider<HomeProvider, HomeState>((ref) => HomeProvider());

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.microtask(() => ref.read(homeProvider.notifier).fetchAndLoad);

    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(homeProvider);

      return state.isLoading == true
          ? Scaffold(
              floatingActionButton:
                  floatingActBtn(() => context.pushNamed(AppRoutes.homeAdd)),
              appBar: appbar(context),
              body: ListView(
                padding: const EdgeInsets.only(top: 16, left: 16),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  dynamicSizedBox(context,
                      heightValue: 0.3,
                      child: _promotionProductList(state.promotionList ?? [])),
                  dynamicSizedBox(context,
                      heightValue: 0.1,
                      child: _categoryChipList(state.categoryList ?? [], ref)),
                  dynamicSizedBox(context,
                      heightValue: 0.5,
                      child: productList(state.filteredList ?? [])),
                ],
              ),
            )
          : circularProgressWidget;
    });
  }

  Widget _promotionProductList(List<PromotionModel> promotionList) =>
      ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => CustomPaddings.customPadding(10),
        scrollDirection: Axis.horizontal,
        itemCount: promotionList.length,
        itemBuilder: (context, index) {
          return promotionContainerWidget(promotionList[index]);
        },
      );
}

Widget _categoryChipList(List<CategoryModel> categoryList, WidgetRef ref) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: categoryList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return categoryChipWidget(
            category: categoryList[index],
            isActive: categoryList[index].id ==
                ref.watch(homeProvider).choosenCategoryId,
            onClick: () {
              ref
                  .read(homeProvider.notifier)
                  .changeChoosenCategory(categoryList[index].id!);
            });
      });
}

Widget productList(List<Product> productList) => ListView.separated(
    separatorBuilder: (context, index) => CustomPaddings.customPadding(8),
    shrinkWrap: true,
    itemCount: productList.length,
    itemBuilder: (context, index) =>
        productContainerWidget(context, productList[index]));
