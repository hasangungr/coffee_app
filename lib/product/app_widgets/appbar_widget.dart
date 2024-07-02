import 'package:coffee_app/product/route/app_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/color_constants.dart';
import '../utilities/service/storage_service.dart';

AppBar appbar(BuildContext context) {
  return AppBar(
    title: Text("Coffee app",
        style:
            TextStyle(color: ColorConstants.white, fontFamily: "PlaywriteNZ")),
    actions: [
      IconButton(
          onPressed: () async {
            FirebaseAuth.instance.signOut();
            await StorageService.instance?.storageDelete(StorageKeys.token);
            if (context.mounted) {
              context.goNamed(AppRoutes.login);
            }
          },
          icon: const Icon(Icons.login)),
    ],
  );
}
