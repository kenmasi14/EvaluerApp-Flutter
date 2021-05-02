import 'package:evaluer_app/Widget/nav.dart';
import 'package:evaluer_app/pages/Main_Page.dart';
import 'package:evaluer_app/pages/login_page.dart';
import 'package:evaluer_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationWrapper extends StatelessWidget{

  List<Widget> _widgetOptions = <Widget>[];

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null){
      return Nav();
    }
      return Center(child: Nav(),);
    
  }
}