import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/widget/custom_paddings.dart';
import '../../product/constants/color_constants.dart';
import '../../product/route/app_route.dart';
import 'home_provider.dart';
import 'widget/dynamic_sizedbox_widget.dart';
import 'widget/prodcut_container_widget.dart';
import 'widget/promotion_container_widget.dart';

import '../../product/model/category_model.dart';
import '../../product/model/product_model.dart';
import '../../product/model/promotion_model.dart';
import '../../product/widgets/appbar_widget.dart';
import '../../product/widgets/circular_progress_widget.dart';
import 'widget/category_chip_widget.dart';

//todo refactor components vs

// class _HomeListView extends StatelessWidget {
//   _HomeListView();

//   final CollectionReference coffees =
//       FirebaseFirestore.instance.collection('coffees');

//   @override
//   Widget build(BuildContext context) {
//     final response = coffees.withConverter(
//       fromFirestore: (snapshot, options) {
//         return Coffee().fromFirebase(snapshot);
//       },
//       toFirestore: (value, options) {
//         return value.toJson;
//       },
//     ).get();

//     return FutureBuilder(
//       future: response,
//       builder: (BuildContext context,
//           AsyncSnapshot<QuerySnapshot<Coffee?>> snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.none:
//             return const Placeholder();
//           case ConnectionState.waiting:
//             return const LinearProgressIndicator();
//           case ConnectionState.active:
//             return const LinearProgressIndicator();
//           case ConnectionState.done:
//             if (snapshot.hasData) {
//               List<Coffee?> values = snapshot.data?.docs
//                       .map(
//                         (e) => e.data(),
//                       )
//                       .toList() ??
//                   [];
//               return ListView.builder(
//                 itemCount: values.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     child: Column(
//                       children: [
//                         Image.network(
//                           values[index]!.backgroundImage!,
//                           height: 100,
//                           width: 100,
//                         ),
//                         Text(values[index]?.title ?? '')
//                       ],
//                     ),
//                   );
//                 },
//               );
//             } else {
//               return Container(height: 100, width: 100, color: Colors.red);
//             }
//         }
//       },
//     );
//   }
// }
final homeProvider =
    StateNotifierProvider<HomeProvider, HomeState>((ref) => HomeProvider());

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //todo refactor
    Future.microtask(() => ref.read(homeProvider.notifier).fetchAndLoad);

    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(homeProvider);

      return state.isLoading == true
          ? Scaffold(
              floatingActionButton: FloatingActionButton.small(
                backgroundColor: ColorConstants.brownColor,
                onPressed: () {
                  context.pushNamed(AppRoutes.homeAdd);
                },
                child: Icon(
                  Icons.add,
                  color: ColorConstants.white,
                ),
              ),
              appBar: appbar(context),
              body: ListView(
                padding: const EdgeInsets.only(top: 16, left: 16),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  //welcome user
                  dynamicSizedBox(context,
                      heightValue: 0.3,
                      child: _promotionProductList(state.promotionList ?? [])),
                  dynamicSizedBox(context,
                      heightValue: 0.1,
                      child: _categoryChipList(state.categoryList ?? [])),
                  dynamicSizedBox(context,
                      heightValue: 0.5,
                      child: productList(state.productList ?? [])),
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

Widget _categoryChipList(List<CategoryModel> categoryList) => ListView.builder(
      shrinkWrap: true,
      itemCount: categoryList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return index == 0
            ? categoryChipWidget(categoryList[index], true)
            : categoryChipWidget(categoryList[index], false);
      },
    );

Widget productList(List<Product> productList) => ListView.separated(
    separatorBuilder: (context, index) => CustomPaddings.customPadding(8),
    shrinkWrap: true,
    itemCount: productList.length,
    itemBuilder: (context, index) =>
        productContainerWidget(context, productList[index]));
