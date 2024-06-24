import 'package:flutter/material.dart';

@immutable
class CustomException implements Exception {
  final String desc;

  const CustomException({required this.desc});

  @override
  String toString() {
    return '$this $desc';
  }
}
