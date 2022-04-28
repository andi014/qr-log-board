import 'package:flutter/material.dart';

class ButtonSquare extends StatelessWidget {
  const ButtonSquare(this.text, this.widget, this.color, {Key? key}) : super(key: key);

  final String text;
  final Widget? widget;
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
