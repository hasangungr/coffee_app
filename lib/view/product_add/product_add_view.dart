import 'package:coffee_app/view/product_add/product_add_manager.dart';

import '../../core/extension/context_extension.dart';
import '../../core/widget/custom_paddings.dart';
import '../../product/constants/color_constants.dart';
import '../../product/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/model/category_model.dart';

class ProductAddView extends ConsumerStatefulWidget {
  const ProductAddView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductAddViewState();
}

class _ProductAddViewState extends ConsumerState<ProductAddView> {
  late ProductAddManager productAddManager;
  @override
  void initState() {
    super.initState();

    productAddManager = ProductAddManager(ref);
  }

  @override
  Widget build(BuildContext context) {
    productAddManager.fetchCategory();
    return Scaffold(
        appBar: appbar(context),
        body: Padding(
            padding: CustomPaddings.padding16,
            child: ListView(
              children: [
                DropdownMenu<CategoryModel>(
                    menuStyle: MenuStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorConstants.white)),
                    onSelected: (value) {},
                    hintText: "Please Choose Product's Category",
                    dropdownMenuEntries: productAddManager.categoryList!
                        .map((e) => DropdownMenuEntry<CategoryModel>(
                            value: e, label: e.categoryName ?? ''))
                        .toList()),
                DropdownButton<CategoryModel>(
                    onChanged: (value) {},
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(12),
                    underline: const SizedBox(),
                    hint: const Text("Please Choose Product's Category"),
                    items: productAddManager.categoryList!
                        .map((e) => DropdownMenuItem<CategoryModel>(
                            value: e, child: Text(e.categoryName ?? '')))
                        .toList()),
                CustomPaddings.customPaddingSizedBoxHeight(20),
                const TextField(
                    decoration: InputDecoration(hintText: "Product Name")),
                CustomPaddings.customPaddingSizedBoxHeight(20),
                const TextField(
                  autocorrect: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Price"),
                ),
                CustomPaddings.customPaddingSizedBoxHeight(20),
                TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(hintText: "Stock")),
                CustomPaddings.customPaddingSizedBoxHeight(20),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: context.dynamicHeight(0.2),
                    // width: context.dynamicWidth(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: ColorConstants.black),
                    ),
                    child: const Icon(Icons.add_a_photo_outlined),
                  ),
                ),
                CustomPaddings.customPaddingSizedBoxHeight(20),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Save",
                      style: TextStyle(color: ColorConstants.white),
                    ))
              ],
            )));
  }
}
