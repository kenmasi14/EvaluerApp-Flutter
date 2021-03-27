import 'package:evaluer_app/pages/Main_Page.dart';
import 'package:evaluer_app/pages/login_page.dart';
import 'package:evaluer_app/pages/profile_page.dart';
import 'package:evaluer_app/pages/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Nav extends StatefulWidget {
  Nav({Key key, SingleChildScrollView child}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedNav = 0;
  List<Widget> _widgetOptions = <Widget>[
    
    MainPage(),
    SearchPage(),
    LoginPage(),
    

  ];
  void _onItemTap (int index) {
    setState(() {
      _selectedNav = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    
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
  return {
    '/': (context){
      return [
    MainPage(),
    SearchPage(),
    LoginPage(),
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


      
