import 'dart:ffi';

import 'package:flutter/material.dart';
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

  Future<bool> allowSignup (String studentId) {
    final data = FirebaseFirestore.instance
        .collection(collectionName)
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