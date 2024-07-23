import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../product/route/app_route.dart';
import 'package:provider/provider.dart';
import '../../core/core_widgets/custom_paddings.dart';
import '../../core/core_widgets/dynamic_sizedbox_widget.dart';
import 'package:coffee_app/core/extension/context_extension.dart';
import '../../product/model/model.dart';
import '../../product/constants/constants.dart';
import '../../product/app_widgets/app_widgets.dart';
import 'home_provider.dart';
part 'widget/promotion_list_widget.dart';
part 'widget/product_list_widget.dart';
part 'widget/category_list_widget.dart';

late HomeProvider homeProvider;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        builder: (context, child) {
          homeProvider = context.watch<HomeProvider>();
          return homeProvider.isLoading == true
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
                          child: _PromotionListWidget(
                              promotionList: homeProvider.promotionList ?? [])),
                      DynamicSizedBox(
                          heightValue: 0.1,
                          child: _CategoryListWidget(
                              categoryList: homeProvider.categoryList ?? [])),
                      DynamicSizedBox(
                          heightValue: 0.5,
                          child: _ProductListWidget(
                              productList: homeProvider.filteredList ?? [])),
                    ],
                  ))
              : circularProgressWidget;
        }
        // child: Consumer<HomeProvider>(builder: (context, value, child) {
        //   homeProvider = value;
        //   return value.isLoading == true
        //       ? Scaffold(
        //           floatingActionButton: FloatingActBtn(onClick: () {
        //             context.pushNamed(AppRoutes.homeAdd);
        //             // context.goNamed(AppRoutes.homeAdd); dispose olmasını
        //           }),
        //           appBar: appbar(context),
        //           body: ListView(
        //             padding: const EdgeInsets.only(top: 16, left: 16),
        //             physics: const NeverScrollableScrollPhysics(),
        //             children: [
        //               DynamicSizedBox(
        //                   heightValue: 0.3,
        //                   child: _PromotionListWidget(
        //                       promotionList: homeProvider.promotionList ?? [])),
        //               DynamicSizedBox(
        //                   heightValue: 0.1,
        //                   child: _CategoryListWidget(
        //                       categoryList: homeProvider.categoryList ?? [])),
        //               DynamicSizedBox(
        //                   heightValue: 0.5,
        //                   child: _ProductListWidget(
        //                       productList: homeProvider.filteredList ?? [])),
        //             ],
        //           ),
        //         )
        //       : circularProgressWidget;
        // }),
        );
  }
}
