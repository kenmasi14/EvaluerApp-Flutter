import 'package:evaluer_app/pages/Main_Page.dart';
import 'package:evaluer_app/pages/login_page.dart';
import 'package:evaluer_app/pages/profile_page.dart';
import 'package:evaluer_app/pages/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evaluer_app/api/locating.dart';

class Nav extends StatefulWidget {
  Nav({Key key, SingleChildScrollView child}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedNav = 0;
  List<Widget> _widgetOptions = <Widget>[];


  void _onItemTap (int index) {
    setState(() {
      _selectedNav = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    _widgetOptions.insert(0, MainPage());
    _widgetOptions.insert(1, SearchPage());
    _widgetOptions.insert(2, firebaseUser !=null? UsersScreen() : LoginPage());
      
    
    
    return Scaffold(
         //child: _widgetOptions.elementAt(_selectedNav),
       
       bottomNavigationBar: 
       BottomNavigationBar(
         items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
             icon: Icon(Icons.home_filled),
             title: Text('Home') 
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.search),
             title: Text('Search')  
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.account_circle_rounded), 
             title: Text('Username')  
           ),
         ],
         currentIndex: _selectedNav,
         onTap: _onItemTap,

         
       ),

       body: Stack(
         children: [
           _buildOffstageNavigator(0),
           _buildOffstageNavigator(1),
           _buildOffstageNavigator(2),

         ],
         
       ),
       
       
       
 
       
    );
    
 
  }


  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    final firebaseUser = context.watch<User>();
    return {
    '/': (context){
      return [
      MainPage(),
      SearchPage(),
      firebaseUser !=null? UsersScreen() : LoginPage(),
      ].elementAt(index);
    }
  };
}

  Widget _buildOffstageNavigator(int index) {
  var routeBuilders = _routeBuilders(context, index);

  return Offstage(
    offstage: _selectedNav != index,
    child: Navigator(
      onGenerateRoute: (routeSettings){
        return MaterialPageRoute(builder: (context)=> routeBuilders[routeSettings.name](context));
      },
    )
  );
}

}


      
