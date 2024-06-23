import 'package:coffee_app/feature/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

 import 'product/constants/string_constants.dart';
import 'product/init/app_init.dart';

Future<void> main() async {
  await AppInit.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.appName,
      theme: ThemeData(useMaterial3: true),
      home: HomeView(),
    );
  }
}



//