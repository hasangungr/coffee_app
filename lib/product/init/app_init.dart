import 'package:coffee_app/firebase_options.dart';
import 'package:coffee_app/product/utilities/service/storage_service.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fbui;

import 'package:flutter/material.dart';

@immutable
class AppInit {
  const AppInit._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    fbui.FirebaseUIAuth.configureProviders([fbui.EmailAuthProvider()]);
    StorageService.instance;
  }
}
