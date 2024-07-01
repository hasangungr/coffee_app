import 'package:coffee_app/product/model/base_model.dart';
import 'package:coffee_app/product/utilities/firebase/firebase_collections.dart';

mixin FirebaseUtility {
  Future<List<T>?> fetchList<T extends BaseFirebaseModel<T>>(
      T data, FirebaseCollections collection) async {
    final collectionReference = collection.reference;

    final response = await collectionReference
        .withConverter(
            fromFirestore: (snapshot, options) => data.fromFirebase(snapshot),
            toFirestore: (value, options) => {})
        .get();

    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      return values;
    }
    return null;
  }
}
