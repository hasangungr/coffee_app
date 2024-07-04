import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseFirebaseModel<T> {
  const BaseFirebaseModel(this.id);
  final String? id;
  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> get toJson;

  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw Exception();
    }
    // fixme
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }
}
