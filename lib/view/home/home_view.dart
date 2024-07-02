import 'package:coffee_app/product/app_widgets/circular_progress_widget.dart';
import 'package:coffee_app/view/home/home_provider.dart';
import 'package:coffee_app/view/home/widget/floating_btn_widget.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/core_widgets/custom_paddings.dart';
import '../../product/route/app_route.dart';

import 'widget/dynamic_sizedbox_widget.dart';
import 'widget/prodcut_container_widget.dart';
import 'widget/promotion_container_widget.dart';

import '../../product/model/category_model.dart';
import '../../product/model/product_model.dart';
import '../../product/model/promotion_model.dart';
import '../../product/app_widgets/appbar_widget.dart';
import 'widget/category_chip_widget.dart';

late HomeProvider homeProvider;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(builder: (context, value, child) {
        homeProvider = value;
        return value.isLoading == true
            ? Scaffold(
                floatingActionButton: FloatingActBtn(onClick: () {
                  context.pushNamed(AppRoutes.homeAdd);
                  // context.goNamed(AppRoutes.homeAdd); dispose olmasını
                }),
                appBar: appbar(context),
                body: ListView(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    DynamicSizedBox(
                        heightValue: 0.3,
                        child:
                            _promotionProductList(value.promotionList ?? [])),
                    DynamicSizedBox(
                        heightValue: 0.1,
                        child: _categoryChipList(value.categoryList ?? [])),
                    DynamicSizedBox(
                        heightValue: 0.5,
                        child: productList(value.filteredList ?? [])),
                  ],
                ),
              )
            : circularProgressWidget;
      }),
    );
  }

  Widget _promotionProductList(List<PromotionModel> promotionList) =>
      ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => CustomPaddings.customPadding(10),
        scrollDirection: Axis.horizontal,
        itemCount: promotionList.length,
        itemBuilder: (context, index) {
          return PromotionContainerWidget(promotion: promotionList[index]);
        },
      );
}

Widget _categoryChipList(List<CategoryModel> categoryList) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: categoryList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return categoryChipWidget(
          category: categoryList[index],
          isActive: categoryList[index].id == homeProvider.choosenCategoryId,
          onClick: () =>
              homeProvider.changeChoosenCategory(categoryList[index].id!),
        );
      });
}

Widget productList(List<Product> productList) => ListView.separated(
    separatorBuilder: (context, index) => CustomPaddings.customPadding(8),
    shrinkWrap: true,
    itemCount: productList.length,
    itemBuilder: (context, index) =>
        ProductContainerWidget(product: productList[index]));
