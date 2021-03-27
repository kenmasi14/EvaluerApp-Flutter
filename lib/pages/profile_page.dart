import 'package:evaluer_app/api/locating.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          ProfilePic(),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0xFFF5F6F9),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_circle_rounded,
                      size: 22,
                      color: Colors.deepOrangeAccent,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        'My Account',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Icon(Icons.arrow_forward)
                  ],
                )),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0xFFF5F6F9),
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_circle_rounded,
                      size: 22,
                      color: Colors.deepOrangeAccent,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        'Log-Out',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Icon(Icons.arrow_forward)
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/usersprofile.jpg'),
          ),
          Positioned(
            right: -12,
            bottom: 0,
            child: SizedBox(
                height: 46,
                width: 46,
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.white)),
                  color: Color(0xFFF5F6F9),
                  onPressed: () {},
                  child: Icon(Icons.camera_alt_rounded),
                )),
          )
        ],
      ),
    );
  }
}
