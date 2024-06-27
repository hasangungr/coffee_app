// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../../product/model/coffees_model.dart';

// class HomeView extends StatelessWidget {
//   HomeView({super.key});

//   final CollectionReference coffees =
//       FirebaseFirestore.instance.collection('coffees');

//   @override
//   Widget build(BuildContext context) {
//     final response = coffees.withConverter(
//       fromFirestore: (snapshot, options) {

//         return Coffees().fromFirebase(snapshot);
//       },
//       toFirestore: (value, options) {
//         return value.toJson();
//       },
//     ).get();

//     return Scaffold(
//       appBar: AppBar(),
//       body: FutureBuilder(
//         future: response,
//         builder: (BuildContext context,
//             AsyncSnapshot<QuerySnapshot<Coffees?>> snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.none:
//               return const Placeholder();
//             case ConnectionState.waiting:
//               return const LinearProgressIndicator();
//             case ConnectionState.active:
//               return const LinearProgressIndicator();
//             case ConnectionState.done:
//               if (snapshot.hasData) {
//                 List<Coffees?> values = snapshot.data?.docs
//                         .map(
//                           (e) => e.data(),
//                         )
//                         .toList() ??
//                     [];
//                 return ListView.builder(
//                   itemCount: values.length,
//                   itemBuilder: (BuildContext context, int index) {

//                     return Card(
//                       child: Column(
//                         children: [
//                           Image.network(
//                             values[index]!.backgroundImage!,
//                             height: 100,
//                             width: 100,
//                           ),
//                           Text(values[index]?.title ?? '')
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 return Container(height: 100, width: 100, color: Colors.red);
//               }
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:coffee_app/core/extension/context_extension.dart';
import 'package:coffee_app/core/widget/custom_paddings.dart';
import 'package:coffee_app/feature/home/widget/dynamic_sizedbox_widget.dart';
import 'package:flutter/material.dart';

import '../../product/widgets/appbar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          dynamicSizedBox(context, heightValue: 0.1, child: categoryChipList()),
          dynamicSizedBox(context,
              heightValue: 0.3, child: promotionProductList()),
          CustomPaddings.customPadding(4),
          dynamicSizedBox(context, heightValue: 0.5, child: productList())
        ],
      ),
    );
  }

  ListView productList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: 25,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.red,
        child: Text(index.toString()),
      ),
    );
  }

  Widget promotionProductList() {
    return CustomPaddings.customPadding(
      16,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => CustomPaddings.customPadding(10),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return const Placeholder();
        },
      ),
    );
  }

  Widget categoryChipList() {
    return CustomPaddings.customPadding(
      16,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Chip(label: Text("label $index")),
          );
        },
      ),
    );
  }
}
