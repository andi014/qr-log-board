
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../Models/users.dart';
import '../Widgets/button.dart';

class GeneratePage extends StatelessWidget {
  const GeneratePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final args = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    final user = ModalRoute.of(context)!.settings.arguments as QueryDocumentSnapshot<Object>;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('QR Code (${user['id']})'),
      //   backgroundColor: Colors.indigo,
      // ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
                children: [
                  SizedBox(height: 110),
                  Icon(
                    Icons.account_circle,
                    size: 80,
                    color: Colors.indigo,
                  ),
                  Text('Student ID: ${user['id']}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                  ),
                  Text('${user['firstName']} ${user['lastName']}'),
                  SizedBox(height: 12),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.indigo,
                            width: 2
                        )
                    ),
                    child: QrImage(
                      data: user['id'],
                      version: QrVersions.auto,
                      size: 320,
                      gapless: false,
                      errorStateBuilder: (cxt, err) {
                        return const Center(
                          child: Text(
                            "Error Generating Code",
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 25),
                  LogBookButton(user['id'])
                ]
            )
        ),
      )
    );
  }
}
