import 'package:cloud_firestore/cloud_firestore.dart';

import '../custom_exception.dart';

abstract class BaseFirebaseModel<T> {
  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> get toJson;

  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw CustomException(desc: '$snapshot data is null');
    }
    // fixme
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }
}
