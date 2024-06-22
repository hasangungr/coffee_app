import 'package:coffee_app/feature/login/login_view.dart';
import 'package:coffee_app/product/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.appName,
      theme: ThemeData(useMaterial3: true),
      home: LoginView(),
    );
  }
}
