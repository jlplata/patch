import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:patchbetav1/models/user_data.dart';
import 'package:patchbetav1/screen/home_screen.dart';
import 'package:patchbetav1/screen/login_screen.dart';
import 'package:patchbetav1/screen/signup_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  
  Widget _getScreenId() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          Provider.of<UserData>(context).currentUserId = snapshot.data.uid;
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      builder: (context) => UserData(),
      child: MaterialApp(
        title: 'Login Patch',
        debugShowCheckedModeBanner: false,
        
        home: _getScreenId(),
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          HomeScreen.id: (context) => HomeScreen(),
        },
      ),
    );
  }
}

