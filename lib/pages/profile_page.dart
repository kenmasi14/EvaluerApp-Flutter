import 'package:evaluer_app/api/locating.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(4, 9, 35, 1),
                  Color.fromRGBO(39, 105, 171, 1),
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 45),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.perm_identity_sharp,
                      color: Colors.white,
                    ),

                    
                    RaisedButton(
                      color: Colors.transparent,
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.read<AuthenticationService>().signOut();
                      },
                    ),
                    
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'My\n Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  height: height * 0.43,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWidth = constraints.maxWidth;
                      return Stack(fit: StackFit.expand, children: <Widget>[
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                                height: innerHeight * 0.72,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: FutureBuilder<dynamic>(
                                  future: context.read<AuthenticationService>().getData(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData){
                                      return Column(
                                    children: [
                                      SizedBox(height: 80),
                                      Text(
                                        snapshot.data, 
                                        style: TextStyle(
                                          color: Color.fromRGBO(39, 105, 171, 1),
                                          fontSize: 37,
                                          ),
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                            ],
                                          )
                                    ],
                                  );

                                    }
                                    return CircularProgressIndicator();
                                  }
                                ),
                                ),
                                
                                )
                      ]);
                    },
                  ),
                )
              ]),
            ),
          ),
        )
      ],
    );
  }
}
