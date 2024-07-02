import 'package:coffee_app/product/constants/image_constants.dart';
import 'package:coffee_app/product/constants/textstyle_constants.dart';

import 'splash_provider.dart';
import '../../product/constants/string_constants.dart';
import '../../product/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  //splash provider
  final splashProvider = StateNotifierProvider<SplashProvider, SplashState>(
      (ref) => SplashProvider());

  @override
  void initState() {
    super.initState();
    ref
        .read(splashProvider.notifier)
        .checkApplicationVersion(clientVersion: '100'); //todo stateless
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashProvider, (previous, next) async {
      if (next.isRequiredForceUpdate ?? false) {
        showAboutDialog(context: context);
        return;
      }
      if (next.isRedirectHome != null) {
        //todo it will be better
        if (next.isRedirectHome!) {
          if (await ref.watch(splashProvider.notifier).checkToken() == true) {
            if (context.mounted) {
              context.goNamed(AppRoutes.home);
            }
          } else {
            if (context.mounted) {
              context.goNamed(AppRoutes.login);
            }
          }
        } else {
          context.goNamed(AppRoutes.login);
        }
      }
    });
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(ImageConstants.logoUrl),
          Center(
              child: Text(StringConstants.appName,
                  style: TextStyleConstants.brownText18))
        ],
      ),
    );
  }
}
