import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Widgets/textInput.dart';
import 'package:firebase_core/firebase_core.dart';
import '../Models/users.dart';
import '../Widgets/toast.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key? key}) : super(key: key);
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final idNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('users').snapshots();

  String idNumber = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
      if(arguments['successful_signup']!=null && arguments['successful_signup']==true) {
        showToast(context, 'Account has been successfully added', Colors.green);
        showToast(context, 'Account is AUTO VERIFIED for  testing purposes.', Colors.grey);
      }
      if(arguments['invalid_cred']!=null && arguments['invalid_cred']==true) {
        showToast(context, 'Invalid login credentials', Colors.red);
      }
    });
  }

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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 120),
                    // StreamBuilder<QuerySnapshot>(
                    //   stream: users,
                    //   builder: (
                    //       BuildContext context,
                    //       AsyncSnapshot<QuerySnapshot> snapshot
                    //   ){
                    //     if(snapshot.hasError) {
                    //       return Text('Something went wrong');
                    //     }
                    //     if(snapshot.connectionState == ConnectionState.waiting) {
                    //       return Text('Loading');
                    //     }
                    //     final data = snapshot.requireData;
                    //     return ListView.builder(
                    //         shrinkWrap: true,
                    //         itemCount: data.size,
                    //         itemBuilder: (context, index) {
                    //           if (data.docs[index]['firstname'] != null ||
                    //               data.docs[index]['lastname'] !=null ) {
                    //             return Text('This is ${data
                    //                 .docs[index]['firstname']} ${data
                    //                 .docs[index]['lastname']}');
                    //           }
                    //           return SizedBox.shrink();
                    //         }
                    //     );
                    //   },
                    // ),
                    // Text('${usersData['email']}'),
                    Image.asset('assets/urs.png',
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(height: 30),
                    Center (
                      child: Text(
                        "URS Log Board",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextInputFormGrayBox(idNumberController, 'ID', TextInputType.text),
                    TextInputFormGrayBox(passwordController, 'Password', TextInputType.visiblePassword),
                    TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            idNumber = idNumberController.text;
                            password = passwordController.text;
                          });
                          await User().verify(idNumber, password).then((QuerySnapshot docs) {
                            if(docs.docs.isNotEmpty) {
                              if(docs.docs[0]['id']=='admin') {
                                Navigator.pushNamed(context, '/scan', arguments: { 'action': 'login' });
                              } else {
                                Navigator.pushNamed(context, '/generate', arguments: docs.docs[0]);
                              }
                            } else {
                              Navigator.pushNamed(context, '/home', arguments: { 'invalid_cred': true });
                            }
                          });
                        }
                      },
                      child: Text(
                        'SIGN IN',
                        style: TextStyle( color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(21)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder( borderRadius: BorderRadius.zero )
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)
                      ),
                    ),
                    // LoginButton(idNumberController.text, passwordController.text),
                    SizedBox(height: 40),
                    GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Don\'t have an account? ',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'SF UI Text'
                              ),
                            ),
                            Text('Sign Up',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold
                                )
                            )
                          ],
                        ),
                        onTap: () => Navigator.pushNamed(context, '/signup')
                    )
                  ],
                ),
              )
          )
      ),
    );
  }
}