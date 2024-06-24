import 'package:coffee_app/product/utilities/service/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationNotifier() : super(AuthenticationState());

  Future<void> signInUser(User? user) async {
    final token = await user?.getIdToken();
    if (token != null) {
      StorageService.instance?.storageWrite(StorageKeys.token, token);

      state = state.updateState(isFetchToken: true);
    } else {
      state = state.updateState(isFetchToken: false);
    }
    debugPrint(await StorageService.instance!.storageRead(StorageKeys.token));
  }
}

class AuthenticationState {
  final bool isFetchToken;

  AuthenticationState({this.isFetchToken = false});

  AuthenticationState updateState({bool? isFetchToken}) {
    return AuthenticationState(isFetchToken: isFetchToken ?? this.isFetchToken);
  }
}
