import 'package:coffee_app/core/extension/context_extension.dart';
import 'package:coffee_app/product/route/app_route.dart';
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
      theme: ThemeData(
        //todo theme class
        useMaterial3: true,
        scaffoldBackgroundColor: context.white,
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all<Color>(context.brownColor),
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(context.brownColor),
            foregroundColor: WidgetStateProperty.all<Color>(context.white),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: context.darkGray),
          hintStyle: TextStyle(color: context.darkGray),
          focusedBorder: OutlineInputBorder(
              borderRadius: context.borderRadiusCircular8,
              borderSide: BorderSide(color: context.brownColor)),
          border: OutlineInputBorder(
            borderRadius: context.borderRadiusCircular8,
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
