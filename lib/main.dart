import 'package:coffee_app/product/utilities/theme/app_theme.dart';

import 'product/route/app_route.dart';
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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      theme: appTheme,
      routerConfig: router,
    );
  }
}
