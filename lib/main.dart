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
        appBarTheme: AppBarTheme(
          backgroundColor: ColorConstants.brownColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorConstants.white),
        ),
        //todo theme class
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              overlayColor: WidgetStateProperty.all<Color>(Colors.black12),
              backgroundColor:
                  WidgetStatePropertyAll(ColorConstants.brownColor)),
        ),
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
          labelStyle: TextStyle(color: ColorConstants.brownColor),
          hintStyle: TextStyle(color: ColorConstants.brownColor),
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
