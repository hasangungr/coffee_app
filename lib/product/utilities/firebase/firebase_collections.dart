import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  version,
  categories,
  products,
  promotions;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}
