import 'package:flutter/material.dart';

@immutable
class ImageConstants {
  const ImageConstants._();
}

extension _StringPath on String {
  String get toPng => 'assets/icon/$this.png';
}
