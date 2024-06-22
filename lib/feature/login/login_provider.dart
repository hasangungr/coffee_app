import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginProvider extends StateNotifier<int> {
  LoginProvider() : super(5);

  void increment() {
    state++;
  }
}
