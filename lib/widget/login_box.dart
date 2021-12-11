import 'package:flutter/material.dart';

class LoginBox extends StatefulWidget {
  _LoginBoxState createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {

  @override
  Widget build(BuildContext context) {
    return Container(              
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,  
        mainAxisAlignment: MainAxisAlignment.center,     
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              child: Text("진입"),
            ),
          ]),
          Row(children: <Widget>[
            Container(
              child: Text("진입"),
            ),
          ]),
        ]
      ),
      alignment: Alignment.bottomLeft,
    );
  }

}