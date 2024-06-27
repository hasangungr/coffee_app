import 'package:coffee_app/core/extension/context_extension.dart';
import 'package:coffee_app/feature/auth/authentication_provider.dart';
import 'package:coffee_app/product/route/app_route.dart';

import 'package:coffee_app/product/widgets/image_logo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fbUi;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/widget/custom_paddings.dart';

class AuthenticationView extends ConsumerStatefulWidget {
  const AuthenticationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationViewState();
}

class _AuthenticationViewState extends ConsumerState<AuthenticationView> {
  final authProvider =
      StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
    return AuthenticationNotifier();
  });

  // @override
  // Future<void> initState() async {
  //   super.initState();

  //   debugPrint(await StorageService.instance!.storageRead(StorageKeys.token));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: CustomPaddings.horizontalPadding16,
          child: ListView(
            children: [
              CustomWidget.imageLogoWidget,
              fbUi.FirebaseUIActions(
                actions: [
                  fbUi.AuthStateChangeAction<SignedIn>(
                    (c, state) async {
                      debugPrint("statement");
                      if (state.user != null) {
                        await ref
                            .read(authProvider.notifier)
                            .signInUser(state.user);
                      }
                      if (context.mounted) {
                        ref.watch(authProvider).isFetchToken == true
                            ? context.goNamed(AppRoutes.home)
                            : showAboutDialog(context: context);
                      }
                    },
                  )
                ],
                child: fbUi.LoginView(
                    showTitle: false,
                    showPasswordVisibilityToggle: true,
                    action: fbUi.AuthAction.signIn, //todo signup view
                    providers: fbUi.FirebaseUIAuth.providersFor(
                        FirebaseAuth.instance.app)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
