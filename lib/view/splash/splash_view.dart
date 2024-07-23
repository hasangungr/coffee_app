import 'package:coffee_app/core/core_widgets/custom_paddings.dart';
import 'package:coffee_app/view/splash/splash_provider.dart';
import 'package:provider/provider.dart';

import '../../product/constants/image_constants.dart';
import '../../product/constants/textstyle_constants.dart';

import '../../product/constants/string_constants.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashProvider>(
      create: (context) => SplashProvider(context),
      lazy: false,
      //true ise provider widgetı oluşturulduğu anda provider classı da oluşur
      //false ise lazım olduğunda ayağa kalkar
      builder: (context, child) {
        return Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomExpanded(),
            Image.asset(ImageConstants.logoUrl),
            Center(
                child: Text(StringConstants.appName,
                    style: TextStyleConstants.brownText18)),
            const CustomExpanded(flex: 3),
          ],
        ));
      },
    );
  }
}
