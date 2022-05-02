
import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  verifyUser(String email, String password) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();
  }
}