import 'package:coffee_app/core/core_widgets/form_widget/dropdown_menu.dart';
import 'package:coffee_app/core/core_widgets/form_widget/text_form_field.dart';
import 'package:coffee_app/view/product_add/product_add_manager.dart';
import 'package:coffee_app/view/product_add/widget/image_picker_widget.dart';

import '../../core/core_widgets/custom_paddings.dart';
import '../../product/app_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/model/category_model.dart';
import '../../core/core_widgets/elevated_btn_widget.dart';

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
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: productAddManager.formKey,
              child: ListView(
                children: [
                  DropdownMenuWidget<CategoryModel>(
                      onSelected: (value) {
                        productAddManager.selectedCategoryId = value?.id;
                      },
                      dataList: productAddManager.categoryList!,
                      labelBuilder: (category) => category.categoryName ?? ''),
                  CustomPaddings.customPaddingSizedBoxHeight(20),
                  TextFormFieldWidget(
                      isNullValid: true,
                      hint: "Product Name",
                      controller: productAddManager.productNameController),
                  CustomPaddings.customPaddingSizedBoxHeight(20),
                  NumberTextFormFieldWidget(
                      controller: productAddManager.priceController,
                      isNullValid: true,
                      hint: "Price"),
                  CustomPaddings.customPaddingSizedBoxHeight(20),
                  NumberTextFormFieldWidget(
                      controller: productAddManager.stockController,
                      isNullValid: true,
                      hint: "Stock"),
                  CustomPaddings.customPaddingSizedBoxHeight(20),
                  ImgPickerWidget(
                      onClick: () {
                        productAddManager.pickImage;
                        setState(() {});
                      },
                      selectedImg: productAddManager.selectedFileBytes),
                  CustomPaddings.customPaddingSizedBoxHeight(20),
                  ElevatedBtnWidget(
                      onTap: () {
                        productAddManager.checkAndSendProduct();
                      },
                      title: "Save")
                ],
              ),
            )));
  }
}




  // DropdownButton<CategoryModel>(
                  //     onChanged: (value) {},
                  //     isExpanded: true,
                  //     borderRadius: BorderRadius.circular(12),
                  //     underline: const SizedBox(),
                  //     hint: const Text("Please Choose Product's Category"),
                  //     items: productAddManager.categoryList!
                  //         .map((e) => DropdownMenuItem<CategoryModel>(
                  //             value: e, child: Text(e.categoryName ?? '')))
                  //         .toList()),