import 'package:netflix_clone_coffee_app/data/login/login_user.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_coffee_app/widget/custom_tab_controller.dart';

class MainScreen extends StatefulWidget {

  final LoginUser user;
  MainScreen({this.user});

  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  LoginUser user;

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {
    return CustomTabController(user: user);
  }
}