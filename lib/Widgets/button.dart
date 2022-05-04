import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Models/logbook.dart';

class StudentAccountButton extends StatelessWidget {
  const StudentAccountButton(this.args, {Key? key}) : super(key: key);

  final QueryDocumentSnapshot<Object> args;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        Navigator.pushNamed(context, '/studentProfile', arguments: args);
      },
      child: Text(
        'View Student History',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal
        ),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(21)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            )
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)
      ),
    );
  }
}

class LogBookButton extends StatelessWidget {
  const LogBookButton(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
      await LogBook().getAllRecords(id).then((QuerySnapshot docs) {
            Navigator.pushNamed(context, '/logbook', arguments: docs);
          });
        // if(id=='noID'){
        //   await LogBook().getAllRecords().then((QuerySnapshot docs) {
        //     Navigator.pushNamed(context, '/logbook', arguments: docs);
        //   });
        // } else {
        //   await LogBook().getAllRecords(id).then((QuerySnapshot docs) {
        //     Navigator.pushNamed(context, '/logbook', arguments: docs);
        //   });
        // }
      },
      child: Text(
        'Log Book Records',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal
        ),
      ),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(21)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)
      ),
    );
  }
}

class AllowButton extends StatelessWidget {
  const AllowButton(this.name, this.id, this.course, {Key? key}) : super(key: key);

  final String name;
  final String id;
  final String course;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 300,
      child: TextButton(
        onPressed: () async {
          await LogBook().create(name, id, course);
          Navigator.pushNamed(context, '/scan', arguments: { 'action': 'added'});
        },
        child: Text(
          'Allow',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal
          ),
        ),
        style: ButtonStyle(
          // padding: MaterialStateProperty.all(EdgeInsets.all(21)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                )
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green)
        ),
      ),
    );
  }
}

class RejectButton extends StatelessWidget {
  const RejectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 300,
      child: TextButton(
        onPressed: () async {
          Navigator.pushNamed(context, '/scan', arguments: { 'action': 'rejected' });
        },
        child: Text(
          'Reject',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal
          ),
        ),
        style: ButtonStyle(
          // padding: MaterialStateProperty.all(EdgeInsets.all(21)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                )
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
        ),
      ),
    );
  }
}

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.white,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            padding: EdgeInsets.all(20),
            color: Colors.grey,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Material(
          color: Colors.white,
          child: IconButton(
            icon: const Icon(
                Icons.add_to_home_screen
            ),
            color: Colors.grey,
            onPressed: () => Navigator.pushNamed(context, '/home'),
          ),
        )
      ],
    );
  }
}
