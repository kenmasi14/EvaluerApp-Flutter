import 'dart:developer';
import 'package:evaluer_app/Widget/background_login.dart';
import 'package:evaluer_app/api/database_connection.dart';
import 'package:evaluer_app/api/locating.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:evaluer_app/main.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text (
                  'SIGNUP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.left,
                )
              ),

              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name'
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(

                    labelText: 'E-Mail Address'
                  ),
                ),
              ),

               SizedBox(height: size.height * 0.03),

               Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password'
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: size.height * 0.05),

              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: RaisedButton(
                  onPressed: ()  {
                    context.read<AuthenticationService>().signUp(
                      email: emailController.text,
                      password: passwordController.text,
                      fname: fullNameController.text,

                    ).then((value) async {
                      User user = FirebaseAuth.instance.currentUser;
                      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
                        'email': emailController,
                        'password': passwordController.text,
                        'fname': fullNameController.text,

                      });
                    });
                    
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(88.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: new BoxDecoration (
                      borderRadius: BorderRadius.circular(80),
                      gradient: new LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 136, 34),
                          Color.fromARGB(255, 255, 177, 41),
                        ]
                      )
                    ),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      'SignUp',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        
                      )
                    ),
                  ),
                )
              ),

              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40,),
                child: RaisedButton(
                  onPressed: () => {
                    Navigator.pop(context)
                    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => LoginPage()))
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(88.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: new BoxDecoration (
                      borderRadius: BorderRadius.circular(80),
                      gradient: new LinearGradient(
                        colors: [
                          Color.fromARGB(255, 63, 94, 251),
                          Color.fromARGB(255, 252, 70, 107),
                        ]
                      )
                    ),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      'Back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        
                      )
                    ),
                  ),
                )
              ),
              
            ]
          ),
        ),
      ),

    );
    
  }
}