import 'package:flutter/material.dart';

class TextInputFormGrayBox extends StatelessWidget {
  const TextInputFormGrayBox(this.userInput, this.hintTitle, this.keyboardType, {Key? key}) : super(key: key);

  final TextEditingController userInput;
  final String hintTitle;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color: Colors.blueGrey.shade200),
      child: Padding(
        padding: EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextFormField(
            controller: userInput,
            autocorrect: false,
            enableSuggestions: false,
            autofocus: false,
            decoration: InputDecoration.collapsed(
              hintText: hintTitle,
              hintStyle: TextStyle(fontSize: 18, color: Colors.white70, fontStyle: FontStyle.italic),
            ),
            keyboardType: keyboardType,
            validator: (value) {
              if(userInput.text.isEmpty){
                return '$hintTitle is required';
              }
              return null;
            }
        ),
      ),
    );
  }
}

class TextInputBorderless extends StatelessWidget {
  const TextInputBorderless(this.userInput, this.title, this.hintTitle, this.keyboardType, {Key? key}) : super(key: key);

  final TextEditingController userInput;
  final String title;
  final String hintTitle;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(title)
        ),
        Container(
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
            ),
          ),
          height: 55,
          margin: const EdgeInsets.only(
            top: 1,
            bottom: 1
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 10, right: 25),
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
          )
        )
      ],
    );
  }
}

class TextInputFormBorderless extends StatelessWidget {
  const TextInputFormBorderless(this.userInput, this.title, this.hintTitle, this.keyboardType, {Key? key}) : super(key: key);

  final TextEditingController userInput;
  final String title;
  final String hintTitle;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(title)
        ),
        Container(
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
              ),
            ),
            height: 55,
            margin: const EdgeInsets.only(
                top: 1,
                bottom: 1
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 10, right: 25),
              child: TextFormField(
                  controller: userInput,
                  keyboardType: keyboardType,
                  decoration: InputDecoration.collapsed(
                    hintText: hintTitle,
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.withOpacity(0.3),
                      fontStyle: FontStyle.italic
                    )
                  ),
                  validator: (value) {
                    if(userInput.text.isEmpty){
                      return '$title is required';
                    }
                    return null;
                  }
              )
            ),
        )
      ],
    );
  }
}