import 'package:flutter/material.dart';
import 'package:test2/Screens/generate.dart';
import 'package:test2/Screens/scan.dart';
import './login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage> {


  final nameController = TextEditingController();
  final studIdController = TextEditingController();
  final courseController = TextEditingController();
  final sectionController = TextEditingController();
  final yearController = TextEditingController();
  final sYController = TextEditingController();

  Widget login(IconData icon) {
    return Container(

      height: 50,
      width: 115,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          TextButton(onPressed: () {}, child: const Text('Login')),
        ],
      ),
    );
  }

  Widget userInput(TextEditingController userInput, String hintTitle, TextInputType keyboardType) {
    return Container(
      decoration: BoxDecoration(

        // color: Colors.blueAccent.withOpacity(0.1),
        // border: Border.all(
        //     color: Colors.grey,
        //     width: 1
        //
        // )

       border: Border(
         left: BorderSide(
           color: Colors.blueAccent.withOpacity(0.4),
           width: 3.0,
         ),
        bottom: BorderSide(
            color: Colors.blueAccent.withOpacity(0.4),
            width: 0
)      ),
      ),
      height: 55,
      margin: const EdgeInsets.only(
          top: 1,
          bottom: 1
      ),
      // decoration: BoxDecoration(color: Colors.blueGrey.shade200),

      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextField(
          controller: userInput,
          autocorrect: false,
          enableSuggestions: false,
          autofocus: false,

          decoration: InputDecoration.collapsed(

            hintText: hintTitle,
            hintStyle: TextStyle(
                fontSize: 18, 
                color: Colors.grey.withOpacity(0.3),
                fontStyle: FontStyle.italic
            ),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Generator"),
        centerTitle: true,
        elevation: 0.0,

      ),
      // appBar: AppBar(
      //   title: const Text("URS Log Board"),
      //   centerTitle: true,
      //   // backgroundColor: Colors.indigo,
      // ),

      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
            top: 0,
            left: 20,
            right: 20,
            bottom: 0
          ),
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 130),
                  // Image.asset(
                  //   'asset-images/urs.png',
                  //   height: 200,
                  //   width: 200,
                  // ),
                  // const SizedBox(height: 30),
                  // const Center (
                  //   child: Text("URS Log Board",
                  //     style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold
                  //     ),
                  //   ),
                  // ),
                  // flatButton("Scan QR CODE", const ScanPage()),
                  // const SizedBox(height: 20.0,),
                  // flatButton("Generate QR CODE", const GeneratePage())


                  userInput(nameController, 'Name', TextInputType.emailAddress),
                  userInput(studIdController, 'Student ID', TextInputType.visiblePassword),
                  userInput(courseController, 'Course', TextInputType.visiblePassword),
                  userInput(sectionController, 'Section', TextInputType.visiblePassword),
                  userInput(yearController, 'Year', TextInputType.visiblePassword),
                  userInput(sYController, 'SY', TextInputType.visiblePassword),


                  const SizedBox(height: 30),
                  TextButton(
                      onPressed: null,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(color: Colors.blueAccent, width: 2),
                            )
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(21)),
                      ),

                      child:
                      const Text('Proceed',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      )
                  ),
                ],
              )
          )
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {

    // return TextButton(
    //     onPressed: () async {
    //       Navigator.of(context)
    //           .push(MaterialPageRoute(builder: (context) => widget));
    //     },
    //     style: ButtonStyle(
    //       padding: MaterialStateProperty.all(15.0)
    //     ),
    //     child:Text(
    //       text,
    //       style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.normal),
    //     )
    // )
    //   )
    return FlatButton(
      // style: ButtonStyle(
      //   padding: MaterialStateProperty(
      //     EdgeInsets.all()
      //   ),
      //
      // )
      padding: const EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.normal),
      ),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.blue,width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),

    );
  }
}