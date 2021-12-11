import 'package:flutter/material.dart';
import 'package:netflix_clone_coffee_app/widget/login_box.dart';
import 'package:netflix_clone_coffee_app/widget/top_bar.dart';

class MemberScreen extends StatefulWidget {
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {  
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: <Widget>[
          TopBar(),  
          Container(            
            child: Row(
              children: <Widget>[
                Text("로그인 방식 선택"),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            height: 40.0,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),                                         
          ),        
          Container(            
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                print("페이스북으로 시작하기");
              },
              child: Text("페이스북으로 시작하기", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              color: Color.fromRGBO(66, 103, 178, 1),
            ),
            height: 40.0, 
            width: double.infinity,                      
            margin: EdgeInsets.symmetric(vertical: 20)                 
          ),
          Container(            
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                print("네이버로 시작하기");
              },
              child: Text("네이버로 시작하기", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              color: Color.fromRGBO(0, 199, 60, 1),
            ),
            height: 40.0,  
            width: double.infinity,                 
            margin: EdgeInsets.only(bottom: 20)
          ),
          Container(            
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                print("구글로 시작하기");
              },
              child: Text("구글로 시작하기", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              color: Colors.white,
            ),
            height: 40.0,
            width: double.infinity,                      
            margin: EdgeInsets.only(bottom: 20),                                   
          ),
          Container(            
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                print("카카오톡으로 시작하기");
              },
              child: Text("카카오톡으로 시작하기", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              color: Color.fromRGBO(247, 230, 0, 1),
            ),
            height: 40.0,
            width: double.infinity,             
          )
        ],
      ), 
    );
  }

  void getLogin() {
    
  }  
}