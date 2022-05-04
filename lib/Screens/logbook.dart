
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../Models/users.dart';
import '../Widgets/button.dart';

class LogBook extends StatelessWidget {
  const LogBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final args = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    // QueryDocumentSnapshot user;

    final data = ModalRoute.of(context)!.settings.arguments as QuerySnapshot<Object>;
    if(data.docs.isNotEmpty) {
      return Scaffold(
        body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    NavigationButtons(),
                    Text('Log Book', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:24
                    )),
                    SizedBox(height: 30),
                    Table(
                      border: TableBorder.symmetric(inside: BorderSide(width: 1, color: Colors.blue)),
                      // TableBorder(
                      //     verticalInside: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid),
                      //     top: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid),
                      //     bottom: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid),
                      //     left: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid),
                      //     right: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid),
                      //     horizontalInside: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid),
                      // ),
                      children: [
                        for (var record in data.docs) TableRow(children: [
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(height: 20),
                                Text(record['date'], textAlign: TextAlign.left),
                                VerticalDivider(
                                  color: Colors.red,
                                  width: 20,
                                ),
                                Text(record['name'], textAlign: TextAlign.left),
                                VerticalDivider(
                                  color: Colors.black,
                                  width: 20,
                                ),
                                Text(record['course'], textAlign: TextAlign.left),
                              ],
                            )
                          )
                        ])
                      ]
                    )
                  ]
                )
              )
        )
      );
    } else {
      return Scaffold(
          body: Column(
            children: const [
              SizedBox(height: 100),
              Text('No data found')
            ],
          )
      );
    }
  }
}
