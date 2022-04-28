import 'package:flutter/material.dart';
import 'package:test2/Screens/homepage.dart';
import 'package:test2/Screens/login.dart';


void main() {
  runApp(
     const MaterialApp(
      title: 'QR Log Board', // used by the OS task switcher
      home: HomePage()
     ),
  );
}