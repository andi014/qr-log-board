import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class LogBook {
  final String logBookCollection = 'logbook';
  final String userCollection = 'users';

  String date = DateFormat('yyyy-MM-dd kk:mm').format(DateTime.now());

  create(String name, String id, String course) {
    return FirebaseFirestore.instance
            .collection(logBookCollection)
            .add({
              'id': id,
              'name': name,
              'course': course,
              'date': date
            });
  }

  getAllRecords(String id) {
    if(id=='noID') {
      return FirebaseFirestore.instance
          .collection(logBookCollection)
          .orderBy('date', descending: true)
          .get();
    } else {
      return FirebaseFirestore.instance
          .collection(logBookCollection)
          .where('id', isEqualTo: id)
          .get();
    }

  }
}