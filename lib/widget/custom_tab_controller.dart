

import 'package:flutter/material.dart';
import 'package:netflix_clone_coffee_app/data/login/login_user.dart';
import 'package:netflix_clone_coffee_app/screen/coupon_screen.dart';
import 'package:netflix_clone_coffee_app/screen/home_screen.dart';
import 'package:netflix_clone_coffee_app/screen/member_screen.dart';

class CustomTabController extends StatelessWidget {

  final LoginUser user;
  CustomTabController({this.user});

  @override
  Widget build(BuildContext context) {
    if(user.token == null) {
      return DefaultTabController(
        length: 2, 
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(), 
            children: <Widget>[
              HomeScreen(),
              MemberScreen()
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.black,
            child: Container(height: 70, 
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                indicatorColor: Colors.white,
                tabs: makeTabList(user)
              ),          
            ),
          )
        )  
      );
    } else {
      return DefaultTabController(
        length: 4, 
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(), 
            children: <Widget>[
              HomeScreen(),              
              CouponScreen(),
              MemberScreen(),              
              Container(
                child: Text('list'),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.black,
            child: Container(height: 70, 
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                indicatorColor: Colors.white,
                tabs: makeTabList(user)
              ),          
            ),
          )
        )  
      );
    }    
  }

  List<Widget> makeTabList(LoginUser user) {
    
    List<Widget> tabList = [];
    if(user.token == null) {
      tabList = <Widget>[
        Tab(
          icon: Icon(Icons.home, size: 18),
          child: Text('홈', style: TextStyle(fontSize: 9)),
        ),
        Tab(
          icon: Icon(Icons.list, size: 18),
          child: Text('My Page', style: TextStyle(fontSize: 9)),
        )
      ];
    } else {
      tabList = <Widget>[
        Tab(
          icon: Icon(Icons.home, size: 18),
          child: Text('홈', style: TextStyle(fontSize: 9)),
        ),
        Tab(
          icon: Icon(Icons.search, size: 18),
          child: Text('Order', style: TextStyle(fontSize: 9)),
        ),
        Tab(
          icon: Icon(Icons.save_alt, size: 18),
          child: Text('저장한 컨텐츠', style: TextStyle(fontSize: 9)),
        ),
        Tab(
          icon: Icon(Icons.list, size: 18),
          child: Text('My Page', style: TextStyle(fontSize: 9)),
        )
      ];
    }
    return tabList;
  } 
}