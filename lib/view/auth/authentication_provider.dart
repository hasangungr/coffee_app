import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:coffee_app/product/utilities/service/storage_service.dart';

class AuthenticationNotifier extends ValueNotifier<bool> {
  AuthenticationNotifier(super.value);

  bool? isFetchToken;

  Future<void> signInUser(User? user) async {
    final token = await user?.getIdToken();
    if (token != null) {
      StorageService.instance?.storageWrite(StorageKeys.token, token);

      isFetchToken = true;
    } else {
      isFetchToken = false;
    }
    debugPrint(await StorageService.instance!.storageRead(StorageKeys.token));
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("auth dispose");
  }
}
