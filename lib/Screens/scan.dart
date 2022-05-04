import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:test2/Models/users.dart';
import 'package:test2/Models/logbook.dart';
import '../Widgets/button.dart';
import '../Widgets/toast.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  var showScanner = true;
  var result = '';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final prevPage = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

      if(prevPage['action']=='added') {
        showToast(context, 'Record has been added successfully', Colors.green);
      }
      if(prevPage['action']=='rejected') {
        showToast(context, 'Log attempt has been rejected', Colors.red);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                NavigationButtons(),
                Text('Scan QR Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                ),
                SizedBox(height: 5),
                Text('Add log book record',
                  textAlign: TextAlign.center
                ),
                SizedBox(height: 20),
                Container(
                  width: 400,
                  height: 490,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.indigo,
                          width: 2
                      )
                  ),
                  child: MobileScanner(
                      fit: BoxFit.scaleDown,
                      allowDuplicates: false,
                      controller: MobileScannerController(
                        facing: CameraFacing.back,
                      ),
                      onDetect: (barcode, args) async {
                        final code = barcode.rawValue;
                        setState( () {
                          showScanner = false;
                          result = code ?? 'empty';
                          },
                        );
                        if(!showScanner && result != 'empty') {
                          await User().getUserById(result).then((QuerySnapshot docs) {
                            if(docs.docs.isNotEmpty) {
                              Navigator.pushNamed(context, '/scanResult', arguments: docs.docs[0] );
                            } else {
                              showToast(context, 'Invalid QR. Unable to extract data', Colors.green);
                            }
                          });
                        } else {
                          showToast(context, 'Invalid QR. Unable to extract data', Colors.green);
                        }
                      }
                  ),
                ),
                SizedBox(height: 10),
                LogBookButton('noID')
              ])
        ),
      )
    );
  }
}
