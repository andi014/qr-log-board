// import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({ Key? key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrCodeResult = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scanner"),
        centerTitle: true,
      ),
      // body: Container(
      //   padding: const EdgeInsets.all(20.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: <Widget>[
      //       const Text(
      //         "Result",
      //         style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      //         textAlign: TextAlign.center,
      //       ),
      //       Text(
      //         qrCodeResult,
      //         style: const TextStyle(
      //           fontSize: 20.0,
      //         ),
      //         textAlign: TextAlign.center,
      //       ),
      //       const SizedBox(
      //         height: 20.0,
      //       ),
      //       FlatButton(
      //         padding: const EdgeInsets.all(15.0),
      //         onPressed: () async {
      //
      //
      //           String codeSanner = await BarcodeScanner.scan();    //barcode scnner
      //           setState(() {
      //             qrCodeResult = codeSanner;
      //           });
      //
      //           // try{
      //           //   BarcodeScanner.scan()    this method is used to scan the QR code
      //           // }catch (e){
      //           //   BarcodeScanner.CameraAccessDenied;   we can print that user has denied for the permisions
      //           //   BarcodeScanner.UserCanceled;   we can print on the page that user has cancelled
      //           // }
      //
      //
      //         },
      //         child: const Text(
      //           "Open Scanner",
      //           style:
      //           TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      //         ),
      //         shape: RoundedRectangleBorder(
      //             side: const BorderSide(color: Colors.blue, width: 3.0),
      //             borderRadius: BorderRadius.circular(20.0)),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

//its quite simple as that you can use try and catch staatements too for platform exception
}
