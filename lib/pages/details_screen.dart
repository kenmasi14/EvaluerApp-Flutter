import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(DetailScreen());

class DetailScreen extends StatelessWidget {
  DetailScreen({
    this.locationID,
    this.locationDocument,
    String locationDocId,
  });
  String locationID;

  DocumentSnapshot locationDocument;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = locationDocument.data();
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('locationdata')
          .doc(locationID)
          .collection('restaurants')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
            body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Image.network(
                  locationDocument['restoimages'],
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    iconSize: 30.0,
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  )
                ]),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.45),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 7,
                        decoration: BoxDecoration(
                            color: Colors.red[50],
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(height: 20),
                      Text(
                        locationDocument['restoname'],
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                      SizedBox(height: 20),
                      Text(
                        locationDocument['restodes'],
                        style: TextStyle(height: 1.3),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 300,
                        height: 7,
                        decoration: BoxDecoration(
                            color: Colors.red[50],
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Gallery',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
      },
    );
  }
}
