import 'package:coffee_app/firebase_options.dart';
import 'package:coffee_app/product/utilities/service/storage_service.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fbUi;

import 'package:flutter/material.dart';

@immutable
class AppInit {
  const AppInit._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    fbUi.FirebaseUIAuth.configureProviders([fbUi.EmailAuthProvider()]);
    StorageService.instance;
  }
}
