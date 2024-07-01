 import 'package:coffee_app/product/model/product_model.dart';
import 'package:coffee_app/product/utilities/firebase/firebase_collections.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coffee_app/product/utilities/firebase/firebase_utility.dart';
import 'package:image_picker/image_picker.dart';

import '../../product/model/category_model.dart';
import '../home/home_view.dart';

import 'dart:typed_data';

class ProductAddManager with FirebaseUtility {
  ProductAddManager(this.ref);

  final WidgetRef ref;

  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController productNameController =
      TextEditingController(text: "Ice Latte");
  final TextEditingController priceController =
      TextEditingController(text: "7");
  final TextEditingController stockController =
      TextEditingController(text: "100");
  String? selectedCategoryId;

  List<CategoryModel>? categoryList;

  XFile? img;
  Uint8List? _selectedFileBytes;
  Uint8List? get selectedFileBytes => _selectedFileBytes;

  void fetchCategory() {
    final state = ref.watch(homeProvider);
    categoryList = state.categoryList;
  }

  Future<void>? get pickImage async {
    final picker = ImagePicker();
    img = await picker.pickImage(source: ImageSource.gallery);
    _selectedFileBytes = await img?.readAsBytes();
  }

  Reference? get createImageReference {
    if (img == null || img?.name == null) {
      return null;
    } else {
      final storageRef = FirebaseStorage.instance.ref();
      return storageRef.child(img!.name);
    }
  }

  Future<void> checkAndSendProduct() async {
    if (formKey.currentState?.validate() == true &&
        selectedFileBytes != null &&
        selectedCategoryId != null &&
        createImageReference != null) {
      await createImageReference?.putData(selectedFileBytes!);
      final urlPath = await createImageReference?.getDownloadURL();
      final response = await FirebaseCollections.products.reference.add(
        Product(
          categoryId: selectedCategoryId,
          productImageUrl: urlPath,
          productName: productNameController.text,
          price: double.tryParse(priceController.text),
          stock: int.tryParse(stockController.text),
        ).toJson,
      );
      if (response.id.isNotEmpty) {
        debugPrint("success");
      } else {
        debugPrint("error");
      }
    } else {
      debugPrint("Error Form");
    }
  }

  void dispose() {
    productNameController.dispose();
    priceController.dispose();
    stockController.dispose();
  }
}
