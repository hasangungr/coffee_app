// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:coffee_app/product/utilities/firebase/firebase_collections.dart';
import 'package:coffee_app/product/utilities/version_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/model/version_model.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(SplashState());

  Future<void> checkApplicationVersion({String? clientVersion}) async {
    final databaseValue = await getVersionNumberFromDb();

    if (databaseValue == null || databaseValue.isEmpty) {
      state = state.updateState(isRedirectHome: false);
      return;
    }

    final checkIsNeedForceUpdate = VersionManager(
        deviceValue: clientVersion ?? '', databaseValue: databaseValue);

    if (checkIsNeedForceUpdate.isNeedUpdate() == false) {
      state = state.updateState(isRequiredForceUpdate: true);
      return;
    }

    state = state.updateState(isRedirectHome: true);
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

    if (platform != null) {
      final response = await FirebaseCollections.version.reference
          .withConverter<VersionModel>(
              fromFirestore: (snapshot, options) =>
                  VersionModel().fromFirebase(snapshot),
              toFirestore: (value, options) => value.toJson())
          .doc(platform)
          .get();

      return response.data()?.number;
    } else {
      return null;
    }
  }
}

class SplashState {
  //force to Update or go Home Page
  bool? isRequiredForceUpdate;
  bool? isRedirectHome;

  SplashState({this.isRequiredForceUpdate, this.isRedirectHome});

  SplashState updateState({bool? isRequiredForceUpdate, bool? isRedirectHome}) {
    return SplashState(
        isRequiredForceUpdate:
            isRequiredForceUpdate ?? this.isRequiredForceUpdate,
        isRedirectHome: isRedirectHome ?? this.isRedirectHome);
  }
}
