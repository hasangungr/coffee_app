import 'package:coffee_app/feature/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final loginProvider = StateNotifierProvider<LoginProvider, int>(
    (ref) => LoginProvider(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Count: ${ref.watch(loginProvider)}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(loginProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
