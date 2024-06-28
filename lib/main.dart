import 'core/extension/context_extension.dart';
import 'product/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product/constants/color_constants.dart';
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
        scaffoldBackgroundColor: ColorConstants.white,
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          foregroundColor:
              WidgetStateProperty.all<Color>(ColorConstants.brownColor),
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all<Color>(ColorConstants.brownColor),
            foregroundColor:
                WidgetStateProperty.all<Color>(ColorConstants.white),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: ColorConstants.darkGray),
          hintStyle: TextStyle(color: ColorConstants.darkGray),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorConstants.brownColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
