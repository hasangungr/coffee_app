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
          return Consumer<ProductAddProvider>(
            builder: (context, value, child) => Scaffold(
                appBar: appbar(context),
                body: Padding(
                    padding: const ConstEdgeInsets.padding8(),
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: value.formKey,
                      child: ListView(
                        children: [
                          DropdownMenuWidget<CategoryModel>(
                              onSelected: (val) =>
                                  value.selectedCategoryId = val?.id,
                              dataList: homeProvider.categoryList ?? [],
                              labelBuilder: (category) =>
                                  category.categoryName ?? ''),
                          const CustomSizedBox.paddingHeight(heightValue: 20),
                          TextFormFieldWidget(
                              isNullValid: true,
                              hint: "Product Name",
                              controller: value.productNameController),
                          const CustomSizedBox.paddingHeight(heightValue: 20),
                          NumberTextFormFieldWidget(
                              controller: value.priceController,
                              isNullValid: true,
                              hint: "Price"),
                          const CustomSizedBox.paddingHeight(heightValue: 20),
                          NumberTextFormFieldWidget(
                              controller: value.stockController,
                              isNullValid: true,
                              hint: "Stock"),
                          const CustomSizedBox.paddingHeight(heightValue: 20),
                          ImgPickerWidget(
                              onClick: () => value.pickImage,
                              selectedImg: value.selectedFileBytes),
                          const CustomSizedBox.paddingHeight(heightValue: 20),
                          ElevatedBtnWidget(
                              onTap: () => value.checkAndSendProduct(),
                              title: "Save")
                        ],
                      ),
                    ))),
          );
        });
  }
}
