import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userCollection = 'users';

  verify(String id, String password) {
    return FirebaseFirestore.instance
        .collection(userCollection)
        .where('id', isEqualTo: id)
        .where('password', isEqualTo: password)
        .get();
  }

  getUserById(String id) {
     return FirebaseFirestore.instance
         .collection(userCollection)
         .where('id', isEqualTo: id)
         .get();
  }

  Future<bool> allowSignup (String studentId) {
    final data = FirebaseFirestore.instance
        .collection(userCollection)
        .where('studentId', isEqualTo: studentId)
        .get();
    return data.then((QuerySnapshot docs) {
      if(docs.docs.isNotEmpty) {
        return false;
      } else {
        return true;
      }
    });
  }
}

class UserData {

  final String email;
  final String firstName;
  final String lastName;
  final String studentId;
  final String courseCode;
  final String section;
  final String yearLevel;
  final String sy;

  UserData(this.email, this.firstName, this.lastName, this.studentId, this.courseCode, this.section, this.yearLevel, this.sy);
}