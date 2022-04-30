import 'package:flutter/material.dart';
import 'package:test2/Screens/homepage.dart';
import 'package:test2/Screens/login.dart';
import 'package:test2/Screens/signUp.dart';


class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, Key? key}) : super(key: key);
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row (
        // <Widget> is the type of items in the list.
        children: [
          const IconButton(
            icon: Icon(Icons.add_box),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child
          // to fill the available space.
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {

    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context) //
                  .primaryTextTheme
                  .headline6,
            ),
          ),
          Row(
            children: const [
              Center(
                child: Text("blab"),
              ),
              Center(
                child: Text("sa",
                style: TextStyle(
                  fontSize: 29
                )),
              )
            ],
          ),
          const Expanded(
            child: Center(
              child: Text('Hello, world XX!'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
     const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SignUpPage()
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}