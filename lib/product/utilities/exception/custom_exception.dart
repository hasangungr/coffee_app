class FirebaseCustomException implements Exception {
  final String desc;

  FirebaseCustomException({required this.desc});

  @override
  String toString() {
    return '$this $desc';
  }
}
