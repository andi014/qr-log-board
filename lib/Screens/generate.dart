import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

const studentId = "123456789";

class GeneratePage extends StatelessWidget {
  const GeneratePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
        child: QrImage(
          data: studentId,
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
    );
  }
}
