import 'package:evaluer_app/pages/destination_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import '../Widget/horizontalView_item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override

  // ignore: override_on_non_overriding_member
  Widget imageCarousel = new Container(
    height: 225.0,
    child: Carousel(
      overlayShadow: false,
      borderRadius: true,
      boxFit: BoxFit.cover,
      dotSize: 5.0,
      indicatorBgPadding: 9.0,
      images: [
        new AssetImage('assets/images/Hotel.jpg'),
        new AssetImage('assets/images/Resort.jpg'),
        new AssetImage('assets/images/Restaurant.jpg'),
        new AssetImage('assets/images/Restaurant2.jpg'),
      ],
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
              title: Container(
                child: Text(
                  'Evaluer',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              elevation: 8,
              backgroundColor: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 280,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    imageCarousel,
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange[800]),
                        child: Text('Top Reviews',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      FlatButton(
                        child: Text('View All'),
                        onPressed: () {},
                      )
                    ]),
              ),
              Container(
                  height: 280,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      HorizontalViewList(),
                      HorizontalViewList(),
                      HorizontalViewList(),
                      HorizontalViewList(),
                      HorizontalViewList(),
                      HorizontalViewList(),
                    ],
                  )),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange[800]),
                      child: Text('Municipality',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    )
                  ],
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('locationdata')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  return GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) => _locationListItem(
                          context, snapshot.data.docs[index]));
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ));
  }
}

Widget _locationListItem(BuildContext context, DocumentSnapshot document) {
  Map<String, dynamic> data = document.data();
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ScreenBoard(
                locationDocId: document.id, locationDocument: document),
          )),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(alignment: Alignment.center, children: [
            Image.network(
              document['imgURL'],
              height: 240,
              fit: BoxFit.cover,
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  //padding: EdgeInsets.only(top: 10, bottom: 10, right: 70, left: 70),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[600].withOpacity(0.8),
                  ),
                  child: Center(
                    child: Text(
                      document['name'],
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ))
          ]),
        ),
      ),
    ),
  );
}


