import 'package:coffee_app/view/auth/authentication_provider.dart';
import 'package:coffee_app/product/constants/image_constants.dart';
import 'package:coffee_app/product/route/app_route.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fbui;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/core_widgets/custom_paddings.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final authProvider =
      StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
    return AuthenticationNotifier();
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: CustomPaddings.horizontalPadding16,
          child: ListView(
            children: [
              Image.asset(ImageConstants.logoUrl),
              fbui.FirebaseUIActions(
                actions: [
                  fbui.AuthStateChangeAction<SignedIn>(
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
                child: fbui.LoginView(
                    showTitle: false,
                    showPasswordVisibilityToggle: true,
                    action: fbui.AuthAction.signIn,
                    providers: fbui.FirebaseUIAuth.providersFor(
                        FirebaseAuth.instance.app)),
              ),
              TextButton(
                  onPressed: () => context.goNamed(AppRoutes.register),
                  child: const Text("Don't you have an account ?"))
            ],
          ),
        ),
      ),
    );
  }
}
