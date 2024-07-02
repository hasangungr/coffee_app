import 'package:coffee_app/product/model/product_model.dart';
import 'package:coffee_app/product/utilities/firebase/firebase_collections.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:coffee_app/product/utilities/firebase/firebase_utility.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:typed_data';

import '../../product/route/app_route.dart';

class ProductAddProvider extends ChangeNotifier with FirebaseUtility {
  ProductAddProvider(this.context);

  BuildContext context;

  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController productNameController =
      TextEditingController(text: "Ice Latte");
  final TextEditingController priceController =
      TextEditingController(text: "7");
  final TextEditingController stockController =
      TextEditingController(text: "100");
  String? selectedCategoryId;

  XFile? img;
  Uint8List? _selectedFileBytes;
  Uint8List? get selectedFileBytes => _selectedFileBytes;

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
      if (context.mounted) {
        if (response.id.isNotEmpty) {
          debugPrint("success");
          context.goNamed(AppRoutes.home);
        } else {
          showAboutDialog(context: context);
        }
      }
    } else {
      showAboutDialog(context: context);
    }
  }

  @override
  void dispose() {
    debugPrint("dispose 1");
    super.dispose();

    stockController.dispose();
    priceController.dispose();
    productNameController.dispose();
    debugPrint("dispose 2");
  }
}
