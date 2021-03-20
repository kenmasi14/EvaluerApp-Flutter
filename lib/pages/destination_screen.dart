import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evaluer_app/pages/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class OtherPage extends StatelessWidget {
  OtherPage({this.locationDocId});

  String locationDocId;

  @override
  Widget build(BuildContext context) {}
}

class ScreenBoard extends StatelessWidget {
  ScreenBoard({this.locationDocId, this.locationDocument});
  String locationDocId;
  DocumentSnapshot locationDocument;
  

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('locationdata')
          .doc(locationDocId)
          .collection('restaurants')
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          body: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.network(
                      locationDocument['imgURL'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                  child: Row(children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    )
                  ]),
                )
              ]),
              Expanded(
                child: ListView.builder(
                    //shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot locationDocument =
                          snapshot.data.docs[index];

                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context, CupertinoPageRoute(builder:(context) => DetailScreen(locationDocId: locationDocument.id, locationDocument:locationDocument))),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(30.0, 5.0, 20.0, 5.0),
                              height: 170,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[100]),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    130.0, 20.0, 20.0, 20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 150.0,
                                          child: Text(
                                            locationDocument['restoname'],
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 45.0,
                              top: 15.0,
                              bottom: 15.0,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(
                                    locationDocument['restoimages'],
                                    width: 110.0,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
