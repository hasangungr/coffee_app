 class CustomException implements Exception {
  final String desc;

  CustomException({required this.desc});

  @override
  String toString() {
    return '$this $desc';
  }
}

 