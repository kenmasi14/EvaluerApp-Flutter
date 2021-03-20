import 'package:flutter/material.dart';
 
class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         child: Column(
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: TextField(
                 controller: searchController,
                 decoration: InputDecoration(
                   suffixIcon: IconButton(
                     icon:Icon(Icons.clear),
                     onPressed: () => searchController.clear(),
                   ),
                   hintText: 'Search Item',
                   hintStyle: (TextStyle(color: Colors.blueGrey))
                 ),
               ),
             )
           ],
         ),
       ),
    );
  }
}