import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './Screens/signup.dart';
import './Screens/homepage.dart';
import './Screens/scan.dart';
import './Screens/generate.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      title: 'QR Log Board', // used by the OS task switcher
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/scan': (context) => ScanPage(),
        '/generate': (context) => GeneratePage(),
        '/signup': (context) => SignUpPage()
      },
     ),
  );
}