import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evaluer_app/api/authenticating.dart';
import 'package:evaluer_app/api/database_connection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:evaluer_app/pages/register_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthenticationService {
  
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();



  Future<void> signOut() async{
    
    await _firebaseAuth.signOut();
  }

  Future<String> getCurrentUserID() async{
    final _firebaseAuth = FirebaseAuth.instance;
    return (await _firebaseAuth.currentUser).uid;

  }

  Future getCurrentUserData() async{
    return (await _firebaseAuth.currentUser).uid;
  }

  Future<String> signIn({String email, String password}) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(msg: 'Sign in');
      
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message,gravity: ToastGravity.TOP);
    }

  }
  Future<String> signUp({String fname,String email, String password})async{
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) async{
        User user = FirebaseAuth.instance.currentUser;
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': email,
          'password': password,
          'name': fname,

        });

      });



    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message,gravity: ToastGravity.TOP);
    }

  }
}