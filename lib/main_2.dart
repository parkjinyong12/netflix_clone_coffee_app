import 'package:netflix_clone_coffee_app/data/login/login_user.dart';
import 'package:netflix_clone_coffee_app/data/login/user_preferences.dart';
import 'package:netflix_clone_coffee_app/data/login/user_provider.dart';
import 'package:netflix_clone_coffee_app/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() => runApp(
//   MyAppProviders(
//     child: MyApp()
//   )
// );

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    Future<LoginUser> getUserData() => UserPreferences().getUser();
    return MaterialApp(
      title: 'CoffeeSubs',
      theme: ThemeData(
        brightness: Brightness.dark, 
        primaryColor: Colors.black, 
        accentColor: Colors.yellow
      ),
      home: FutureBuilder(
        future: getUserData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              if(snapshot.hasError) {
                return Text('Error: ${snapshot.error}');                  
              } else {
                return MainScreen(user: snapshot.data);
              }
          }
        }
      )
    );
  } 
}


class MyAppProviders extends StatelessWidget {
  final Widget child;

  MyAppProviders({this.child});

  @override 
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: child
    );
  }
}
