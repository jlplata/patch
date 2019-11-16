import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:patchbetav1/models/user_data.dart';
import 'package:provider/provider.dart';

class AuthService 
{
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;
  

  static void signUpUser(
    BuildContext context, String name, String email, String password) async
  {
     try 
     {
       AuthResult authResult = await _auth.createUserWithEmailAndPassword
       (
         email: email,
         password: password, 
       );
       FirebaseUser signedInUser = authResult.user;
       if (signedInUser != null) 
       {
         _firestore.collection('/users').document(signedInUser.uid).setData(
           {
             'name': name,
             'email': email,
             'profileImageUrl': '',
           }
           );  
             Provider.of<UserData>(context).currentUserId = signedInUser.uid;
        Navigator.pop(context);
       } 
     } catch (e) 
     {
       print(e);
     }
  }

  static void cerrarSesion(BuildContext context)
  {
    _auth.signOut();
    //Navigator.pushReplacementNamed(context, LoginScreen.id);
  }

  static void login(String correo, String password) async
  {
   await _auth.signInWithEmailAndPassword(email: correo, password: password);
  }

}