import 'package:coffee_app/view/auth/authentication_provider.dart';
import 'package:coffee_app/product/constants/image_constants.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fbui;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/core_widgets/custom_paddings.dart';
import '../../product/route/app_route.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
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
                  fbui.AuthStateChangeAction<UserCreated>(
                    (c, state) async {
                      if (state.credential.user != null) {
                        context.goNamed(AppRoutes.login);
                      }
                    },
                  )
                ],
                child: fbui.LoginView(
                    showTitle: false,
                    showPasswordVisibilityToggle: true,
                    action: fbui.AuthAction.signUp, //todo signup view

                    providers: fbui.FirebaseUIAuth.providersFor(
                        FirebaseAuth.instance.app)),
              ),
              TextButton(
                  onPressed: () => context.goNamed(AppRoutes.login),
                  child: const Text("Do you have an account ?"))
            ],
          ),
        ),
      ),
    );
  }
}
