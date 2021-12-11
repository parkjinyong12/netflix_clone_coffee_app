

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_coffee_app/data/login/login_user.dart';

enum UserAuthStatus {
  SignedIn,
  CodeSent,
  HasError,
  SignedOut,
}

class UserProvider with ChangeNotifier {
 
  final FirebaseAuth userAuth = FirebaseAuth.instance;
  UserAuthStatus userAuthStatus = UserAuthStatus.SignedOut;
  
  User currentUser = null;

  UserAuthStatus get status => userAuthStatus;
  User get user => currentUser;

  void setUser(User user) {
    currentUser = user;
    notifyListeners();
  }
}