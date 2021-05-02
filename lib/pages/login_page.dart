import 'package:evaluer_app/Widget/background_login.dart';
import 'package:evaluer_app/Widget/nav.dart';
import 'package:evaluer_app/api/locating.dart';
import 'package:evaluer_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  'Login',
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
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value.isEmpty){
                      
                      return 'Email: cannot be empty';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'E-Mail Address'
                  ),
                ),
              ),

               SizedBox(height: size.height * 0.03),

               Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value.isEmpty){
                      return 'Password: cannot be empty';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Password'
                  ),
                  obscureText: true,
                  
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF2661FA)
                  ),
                )
              ),
              SizedBox(height: size.height * 0.05),

              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: RaisedButton(
                  onPressed: (){
                    context.read<AuthenticationService>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    
                    
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
                      'Login',
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()))
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
                      'SignUp',
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