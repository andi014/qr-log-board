import 'package:flutter/material.dart';

class ButtonSquare extends StatelessWidget {
  const ButtonSquare(this.text, this.widget, this.color, {Key? key}) : super(key: key);

  final String text;
  final Function widget;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if(widget!=null) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget as Widget));
        }
      },
      child: Text(
        text,
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
        backgroundColor: MaterialStateProperty.all<Color>(color)
      ),
    );
  }
}

class ButtonRounded extends StatelessWidget {
  const ButtonRounded(this.text, this.widget, this.color, {Key? key}) : super(key: key);

  final String text;
  final Widget widget;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.blue,fontWeight: FontWeight.normal),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(21)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            )
        )
      ),
    );
  }
}

class ButtonBack extends StatelessWidget {
  const ButtonBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: Colors.white,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.grey,
            onPressed: () => Navigator.pop(context),
          ),
        )
      ],
    );
  }
  // Widget build(BuildContext context) {
  //   return IconButton(
  //     onPressed: () => Navigator.pop(context),
  //     icon: Icon(Icons.android),
  //     color: Colors.indigo,
  //     iconSize: 20,
  //   );
  // }
  }