
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../Models/users.dart';
import '../Models/logbook.dart';
import '../Widgets/button.dart';

class ScanResult extends StatelessWidget {
  const ScanResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = ModalRoute.of(context)!.settings.arguments as QueryDocumentSnapshot;
    final id = user['id'];
    final name = '${user['firstName']} ${user['lastName']}';
    final course = '${user['yearLevel']}-${user['courseCode']} ${user['section']}';

    return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
                child: Column(
                    children: [
                      SizedBox(height: 40),
                      NavigationButtons(),
                      SizedBox(height: 20),
                      Icon(
                        Icons.account_circle,
                        size: 120,
                        color: Colors.indigo,
                      ),
                      SizedBox(height: 10),
                      Text('Student ID: ${user['id']}',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text('Name: $name',
                          textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
                      Text('Email: ${user['email']}',
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
                      Text('Course: $course',
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
                      SizedBox(height: 60),
                      AllowButton(name, id, course),
                      SizedBox(height: 20),
                      RejectButton()
                    ]
                )
            ),
          )
      );
    }
  }
