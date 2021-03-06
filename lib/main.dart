import 'package:evaluer_app/pages/Main_Page.dart';
import 'package:evaluer_app/pages/detail_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyAppBar());
}

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        ScreenBoard.routeName: (ctx) => ScreenBoard()
      },
    );
  }

}