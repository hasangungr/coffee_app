import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/core/extension/context_extension.dart';
import 'package:coffee_app/core/widget/custom_paddings.dart';
import 'package:coffee_app/feature/home/home_provider.dart';
import 'package:coffee_app/feature/home/widget/dynamic_sizedbox_widget.dart';
import 'package:coffee_app/feature/home/widget/promotion_container_widget.dart';
import 'package:coffee_app/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/model/category_model.dart';
import '../../product/model/coffee_model.dart';
import '../../product/model/promotion_model.dart';
import '../../product/widgets/appbar_widget.dart';
import '../../product/widgets/circular_progress_widget.dart';
import 'widget/category_chip_widget.dart';

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

class HomeView extends ConsumerWidget {
  HomeView({super.key});

  final _homeProvider =
      StateNotifierProvider<HomeProvider, HomeState>((ref) => HomeProvider());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //todo refactor
    Future.microtask(() => ref.read(_homeProvider.notifier).fetchAndLoad());

    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(_homeProvider);

      return state.isLoading == true
          ? Scaffold(
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
                      heightValue: 0.5, child: _productList),
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

Widget get _productList => ListView.separated(
    separatorBuilder: (context, index) => CustomPaddings.customPadding(8),
    shrinkWrap: true,
    itemCount: 25,
    itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              //todo generic
              border: Border(
                  bottom: BorderSide(color: ColorConstants.brownColor),
                  left: BorderSide(color: ColorConstants.brownColor),
                  top: BorderSide(color: ColorConstants.brownColor)),
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(12),
              )),
          child: Row(
            children: [
              Expanded(
                child: Container(
                    height: context.dynamicHeight(0.1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/coffee-app-95562.appspot.com/o/latte.jpg?alt=media&token=220b25f2-8adc-492f-97ba-6abfc8811c40",
                        ),
                      ),
                    )),
              ),
              CustomPaddings.customPaddingHorizontal(4),
              const Text("Coffee Latte"),
              const Expanded(flex: 2, child: SizedBox()),
              Text("$index\$"),
              CustomPaddings.customPaddingHorizontal(8),
            ],
          ),
        ));
