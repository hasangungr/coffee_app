import 'dart:io';

import 'package:coffee_app/product/utilities/firebase/firebase_collections.dart';
import 'package:coffee_app/product/utilities/service/storage_service.dart';
import 'package:coffee_app/product/utilities/version_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../product/model/version_model.dart';
import '../../product/route/app_route.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider(BuildContext context) {
    debugPrint("splash provider init");
    checkApplicationVersionAndToken(context: context);
  }

  bool? isVersionsValid;

  bool? isUserHasTokenValid;

  bool? isReady;

  Future<void> checkApplicationVersionAndToken(
      {required BuildContext context}) async {
    String? responseDbVersion = await getVersionNumberFromDb();
    final checkIsNeedForceUpdate =
        VersionManager(deviceValue: "1.0.0", databaseValue: responseDbVersion);

    checkIsNeedForceUpdate.isNeedUpdate() == true
        ? isVersionsValid = true
        : isVersionsValid = false;

    await checkToken() == true
        ? isUserHasTokenValid = true
        : isUserHasTokenValid = false;

    if (context.mounted) {
      if (isVersionsValid == true) {
        isUserHasTokenValid == true
            ? context.goNamed(AppRoutes.home)
            : context.goNamed(AppRoutes.login);
      } else {
        showAboutDialog(context: context);
      }
    }
  }

  Future<String?> getVersionNumberFromDb() async {
    //fetch version in db

    String? platform;
    if (kIsWeb) {
      platform = null;
    } else if (Platform.isAndroid) {
      platform = "android";
    } else {
      platform = "ios";
    }

    await Future.delayed(const Duration(seconds: 2));
    if (platform != null) {
      final response = await FirebaseCollections.version.reference
          .withConverter<VersionModel>(
              fromFirestore: (snapshot, options) =>
                  VersionModel().fromFirebase(snapshot),
              toFirestore: (value, options) => value.toJson)
          .doc(platform)
          .get();

      return response.data()?.number;
    }
    return null;
  }

  Future<bool> checkToken() async {
    debugPrint("check token");
    final storageToken =
        await StorageService.instance?.storageRead(StorageKeys.token);
    final fetchToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    debugPrint(storageToken);
    return storageToken == fetchToken ? true : false;
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("splash dispose");
  }
}
