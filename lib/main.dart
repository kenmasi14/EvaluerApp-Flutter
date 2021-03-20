import 'package:evaluer_app/Widget/nav.dart';
import 'package:evaluer_app/api/locating.dart';
import 'package:evaluer_app/pages/Main_Page.dart';
import 'package:evaluer_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyAppBar());
}

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticanService>(
          create: (_) => AuthenticanService(FirebaseAuth.instance),
          ),
          StreamProvider(create: (context) => context.read<AuthenticanService>().authStateChanges)
      ],
          child: MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: AuthenticationWrapper(
          
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

}

class AuthenticationWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser == null){
      return Nav();
    }
    return Nav();
    
  }
}