import 'package:firebase_auth/firebase_auth.dart';
import 'package:netflix_clone_coffee_app/data/login/login_user.dart';
import 'package:netflix_clone_coffee_app/data/login/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class UserPreferences {
  Future<bool> saveUser(LoginUser user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString("userId", user.userId);
    prefs.setString("name", user.name);
    prefs.setString("email", user.email);
    prefs.setString("phone", user.phone);
    prefs.setString("token", user.token);

    return prefs.commit();
  }

  Future<LoginUser> getUser() async {

    // Provider.of<UserProvider>(context, listen: false).setUser(user)
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String userId = prefs.getString("userId");
    String name = prefs.getString("name");
    String email = prefs.getString("email");
    String phone = prefs.getString("phone");
    String token = prefs.getString("token");

    return LoginUser(
      userId: userId,
      name: name,
      email: email,
      phone: phone,
      token: token
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("phone");
    prefs.remove("token");
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");
    return token;
  }
}