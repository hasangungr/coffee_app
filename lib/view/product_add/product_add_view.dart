import 'package:coffee_app/core/core_widgets/form_widget/text_form_field.dart';
import 'package:coffee_app/view/home/home_view.dart';
import 'package:coffee_app/view/product_add/product_add_provider.dart';
import 'package:coffee_app/view/product_add/widget/image_picker_widget.dart';
import 'package:provider/provider.dart';

import '../../core/core_widgets/custom_paddings.dart';
import '../../core/core_widgets/form_widget/dropdown_menu.dart';
import '../../product/app_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../core/core_widgets/elevated_btn_widget.dart';
import '../../product/model/category_model.dart';

class ProductAddView extends StatelessWidget {
  const ProductAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductAddProvider>(
        create: (context) => ProductAddProvider(context),
        lazy: false,
        builder: (context, widget) {
          final productProvider = context.read<ProductAddProvider>();

          return Scaffold(
              appBar: appbar(context),
              body: Padding(
                  padding: CustomPaddings.padding16,
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: productProvider.formKey,
                    child: ListView(
                      children: [
                        DropdownMenuWidget<CategoryModel>(
                            onSelected: (value) =>
                                productProvider.selectedCategoryId = value?.id,
                            dataList: homeProvider.categoryList ?? [],
                            labelBuilder: (category) =>
                                category.categoryName ?? ''),
                        CustomPaddings.customPaddingSizedBoxHeight(20),
                        TextFormFieldWidget(
                            isNullValid: true,
                            hint: "Product Name",
                            controller: productProvider.productNameController),
                        CustomPaddings.customPaddingSizedBoxHeight(20),
                        NumberTextFormFieldWidget(
                            controller: productProvider.priceController,
                            isNullValid: true,
                            hint: "Price"),
                        CustomPaddings.customPaddingSizedBoxHeight(20),
                        NumberTextFormFieldWidget(
                            controller: productProvider.stockController,
                            isNullValid: true,
                            hint: "Stock"),
                        CustomPaddings.customPaddingSizedBoxHeight(20),
                        ImgPickerWidget(
                            onClick: () {
                              productProvider.pickImage;
                            },
                            selectedImg: productProvider.selectedFileBytes),
                        CustomPaddings.customPaddingSizedBoxHeight(20),
                        ElevatedBtnWidget(
                            onTap: () {
                              productProvider.checkAndSendProduct();
                            },
                            title: "Save")
                      ],
                    ),
                  )));
        });
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