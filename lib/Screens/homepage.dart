import 'package:flutter/material.dart';
import 'package:test2/Screens/generate.dart';
import 'package:test2/Screens/scan.dart';
import './login.dart';
import '../Widgets/textInput.dart';
import '../Widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 130),
                  const Image(
                    image: NetworkImage(
                        "http://www.urs.edu.ph/wp-content/uploads/about-us/university-seal/university-seal.png"),
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 30),
                  const Center (
                    child: Text(
                      "URS Log Board",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextInput1(
                      emailController, 'Email', TextInputType.emailAddress),
                  TextInput1(passwordController, 'Password',
                      TextInputType.visiblePassword),
                  ButtonSquare("SIGN IN", GeneratePage(), Colors.indigo)
                ],
              )
          )
      ),
    );
  }
}