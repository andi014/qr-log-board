import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test2/Models/users.dart';
import 'package:test2/Widgets/toast.dart';
import '../Widgets/textInput.dart';
import '../Widgets/button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final idController = TextEditingController();
  final courseCodeController = TextEditingController();
  final sectionController = TextEditingController();
  final yearLevelController = TextEditingController();
  final syController = TextEditingController();
  final pwController1 = TextEditingController();
  final pwController2 = TextEditingController();

  Map<String, String> user = {};
  String password2 ='';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
          color: Colors.white,
          child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40),
                    NavigationButtons(),
                    Text('Create Account', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    )),
                    Text('Signup Page', style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12
                    )),
                    TextInputFormBorderless(emailController, 'Email', 'ex. notrealuser@gmail.com', TextInputType.emailAddress),
                    TextInputFormBorderless(firstNameController, 'First Name', 'ex. Juan', TextInputType.text),
                    TextInputFormBorderless(lastNameController, 'Last Name', 'ex. Dela Cruz', TextInputType.text),
                    TextInputFormBorderless(idController, 'Student Number', 'ex. 111023213', TextInputType.number),
                    TextInputFormBorderless(courseCodeController, 'Course Code', 'ex. CpE', TextInputType.text),
                    TextInputFormBorderless(sectionController, 'Section', 'ex. A', TextInputType.text),
                    TextInputFormBorderless(yearLevelController, 'Year Level', 'ex. 1', TextInputType.number),
                    TextInputFormBorderless(syController, 'SY', 'ex. 2021-2022', TextInputType.text),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(21),
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                color: Colors.blue.withOpacity(.50),
                                width: 3.0,
                              ),
                              bottom: BorderSide(
                                  color: Colors.blue.withOpacity(.50),
                                  width: 0
                              )
                          )
                      ),
                      child: Column(
                        children: [
                          TextInputFormGrayBox(pwController1, 'Password', TextInputType.text),
                          TextInputFormGrayBox(pwController2, 'Re-enter Password', TextInputType.text)
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              user['email'] = emailController.text;
                              user['firstName'] = firstNameController.text;
                              user['lastName'] = lastNameController.text;
                              user['id'] = idController.text;
                              user['courseCode'] = courseCodeController.text;
                              user['section'] = sectionController.text;
                              user['yearLevel'] = yearLevelController.text;
                              user['sy'] = syController.text;
                              user['password'] = pwController1.text;
                              user['createdAt'] = DateTime.now().toString();
                              password2 = pwController2.text;
                            });

                            if(user['password']==password2) {
                              if(await User().allowSignup(user['id'] as String)) {
                                await userCollection.add(user);
                                Navigator.pushNamed(context, '/home', arguments: { 'successful_signup': true });
                              } else {
                                showToast(context, 'User already exists', Colors.red);
                              }
                            } else {
                              showToast(context, 'Password does not match', Colors.red);
                            }
                          }
                        },
                        child: Text('Proceed', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.all(21)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)
                        )
                    ),
                  ],
                )
              )
          )
      ),
    );
  }
}


