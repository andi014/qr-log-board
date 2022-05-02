
import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  final String collectionName = 'users';

  verify(String email, String password) {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();
  }

  create() {
    return FirebaseFirestore.instance
        .collection(collectionName);
  }
}