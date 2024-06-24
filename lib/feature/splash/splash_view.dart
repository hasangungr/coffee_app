import 'package:coffee_app/core/extension/context_extension.dart';
import 'package:coffee_app/feature/splash/splash_provider.dart';
import 'package:coffee_app/product/constants/image_constants.dart';
import 'package:coffee_app/product/constants/string_constants.dart';
import 'package:coffee_app/product/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// class SplashView extends ConsumerWidget {
//   SplashView({super.key});

//   final splashProvider =
//       StateNotifierProvider<SplashProvider, SplashState>((ref) {
//     return SplashProvider();
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     ref.listen(
//       splashProvider,
//       (previous, next) {
//         if (next.isRequiredForceUpdate ?? false) {
//           showAboutDialog(context: context);
//           return;
//         }
//         if (next.isRedirectHome != null) {
//           if (next.isRedirectHome!) {
//             context.goNamed(RoutesName.home);
//           } else {}
//         }
//       },
//     );

//     ref.read(splashProvider.notifier).checkApplicationVersion('');
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(child: Image.asset(ImageConstants.logoUrl)),
//           Text(StringConstants.appName, style: context.brownText)
//         ],
//       ),
//     );
//   }
// }

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
        .checkApplicationVersion(clientVersion: '100'); //todo
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashProvider, (previous, next) {
      if (next.isRequiredForceUpdate ?? false) {
        showAboutDialog(context: context);
        return;
      }
      if (next.isRedirectHome != null) {
        if (next.isRedirectHome!) {
          context.goNamed(RoutesConstants.home);
        } else {
          // false
        }
      }
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset(ImageConstants.logoUrl)),
          Text(StringConstants.appName, style: context.brownText)
        ],
      ),
    );
  }
}
