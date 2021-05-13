import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:evaluer_app/Widget/rating_dialog.dart';
import 'package:evaluer_app/api/dropdownlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(DetailScreen());

class DetailScreen extends StatelessWidget {
  DetailScreen({
    this.locationID,
    this.locationDocument,
    this.productId,
    String locationDocId,
  });
  String locationID;
  final String productId;

  DocumentSnapshot locationDocument;
  final logBookController = TextEditingController();
  final temperatureController = TextEditingController();
  final faceMaskController = TextEditingController();
  final socialDistancingController = TextEditingController();
  final reviewerController = TextEditingController();
  double selectCovid = 0;
  double ratingFood = 0;
  double ratingService = 0;

  @override
  Widget build(BuildContext context) {
    final CollectionReference _productRef = FirebaseFirestore.instance
        .collection('locationdata')
        .doc(locationID)
        .collection('restaurants');
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
                        locationDocument['restoname'], textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                      Container(
                        child: SmoothStarRating(
                          rating: 5.0,
                          isReadOnly: false,
                          size: 20,
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.star_half,
                          defaultIconData: Icons.star_border,
                          starCount: 5,
                          allowHalfRating: true,
                          spacing: 2.0,
                        ),
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
                      SizedBox(height: 10),
                      FutureBuilder(
                        future: _productRef.doc(productId).get(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          List imageList = locationDocument['restoCarousel'];
                          return Container(
                            height: 200,
                            width: double.infinity,
                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Container(
                                  height: 200,
                                  child: PageView(children: [
                                    for (var i = 0; i < imageList.length; i++)
                                      Container(
                                          child: Image.network(
                                        "${imageList[i]}",
                                        fit: BoxFit.cover,
                                      ))
                                  ]),
                                ),
                              ],
                            ),
                          );
                        },
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'REVIEWS',
                              style: TextStyle(fontSize: 24),
                            ),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        width: MediaQuery.of(context).size.width * 100,
                                        child: AlertDialog(
                                          
                                          
                                          title: Text(
                                            locationDocument['restoname'],
                                            textAlign: TextAlign.center,
                                          ),
                                          titleTextStyle: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child:
                                                  Text('cancel'.toUpperCase()),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                User user = FirebaseAuth
                                                    .instance.currentUser;

                                                Map<String, dynamic> data = {
                                                  'restoName': locationDocument[
                                                      'restoname'],
                                                  'createdAt': FieldValue
                                                      .serverTimestamp(),
                                                  'establishmentID':
                                                      locationDocument.id,
                                                  'userID': user.uid,
                                                  'ratingFood': ratingFood,
                                                  'ratingService':
                                                      ratingService,
                                                  'logBook':
                                                      logBookController.text,
                                                  'temperatureCheck': temperatureController.text,
                                                  'faceMaskShield': faceMaskController.text,
                                                  'socialDistancing': socialDistancingController.text,
                                                  'reviewCComment': reviewerController.text,
                                                };
                                                FirebaseFirestore.instance
                                                    .collection('reviews')
                                                    .add(data);
                                                Navigator.of(context).pop();
                                              },
                                              child:
                                                  Text('submit'.toUpperCase()),
                                            ),
                                          ],
                                          content: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Center(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'Your opinion matters to us!',
                                                        style: TextStyle(
                                                            fontSize: 14.0),
                                                      ),
                                                      SizedBox(height: 20),
                                                      Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                'How was their food?'),
                                                            SmoothStarRating(
                                                              rating:
                                                                  ratingFood,
                                                              isReadOnly: false,
                                                              size: 20,
                                                              filledIconData:
                                                                  Icons.star,
                                                              halfFilledIconData:
                                                                  Icons
                                                                      .star_half,
                                                              defaultIconData:
                                                                  Icons
                                                                      .star_border,
                                                              starCount: 5,
                                                              allowHalfRating:
                                                                  true,
                                                              spacing: 2.0,
                                                              onRated: (rated) {
                                                                this.ratingFood =
                                                                    rated;
                                                              },
                                                            ),
                                                          ]),
                                                      SizedBox(height: 20),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              'How was their Service?'),
                                                          SmoothStarRating(
                                                            rating:
                                                                ratingService,
                                                            isReadOnly: false,
                                                            size: 20,
                                                            filledIconData:
                                                                Icons.star,
                                                            halfFilledIconData:
                                                                Icons.star_half,
                                                            defaultIconData:
                                                                Icons
                                                                    .star_border,
                                                            starCount: 5,
                                                            allowHalfRating:
                                                                true,
                                                            spacing: 2.0,
                                                            onRated: (value) {
                                                              this.ratingService =
                                                                  value;
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 25,
                                                      ),
                                                      Text(
                                                        'Health Protocol Compliance',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(height: 25),
                                                      Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text('LogBook'),
                                                            DropDownField(
                                                              
                                                              controller:
                                                                  logBookController,
                                                              hintText:
                                                                  'Select',
                                                              enabled: true,
                                                              items: covid,
                                                              onValueChanged:
                                                                  (value) {
                                                                this.selectCovid =
                                                                    value;
                                                              },
                                                            ),
                                                            SizedBox(
                                                                height: 25),
                                                            Text(
                                                                'Temperature Check'),
                                                            DropDownField(
                                                              controller:
                                                                  temperatureController,
                                                              hintText:
                                                                  'Select',
                                                              enabled: true,
                                                              items: covid,
                                                              onValueChanged:
                                                                  (value) {
                                                                this.selectCovid =
                                                                    value;
                                                              },
                                                            ),
                                                            SizedBox(
                                                                height: 25),
                                                            Text(
                                                                'Face Mask & Shield'),
                                                            DropDownField(
                                                              controller:
                                                                  faceMaskController,
                                                              hintText:
                                                                  'Select',
                                                              enabled: true,
                                                              items: covid,
                                                              onValueChanged:
                                                                  (value) {
                                                                this.selectCovid =
                                                                    value;
                                                              },
                                                            ),
                                                            SizedBox(
                                                                height: 25),
                                                            Text(
                                                                'Social Distancing'),
                                                            DropDownField(
                                                              controller:
                                                                  socialDistancingController,
                                                              hintText:
                                                                  'Select',
                                                              enabled: true,
                                                              items: covid,
                                                              onValueChanged:
                                                                  (value) {
                                                                this.selectCovid =
                                                                    value;
                                                              },
                                                            ),
                                                          ]),
                                                    ],
                                                  ),
                                                ),
                                                TextFormField(
                                                  controller:
                                                      reviewerController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          'Write a Review'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    );
                              },
                              child: Text('Write a Review'),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.orange)),
                            ),
                          ]
                          ),
                      Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'UserName'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('05-21-2018')
                              ],
                            ),
                            SizedBox(height: 50),
                            SmoothStarRating(
                              rating: 5.0,
                              isReadOnly: true,
                              size: 20,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              defaultIconData: Icons.star_border,
                              starCount: 5,
                              allowHalfRating: true,
                              spacing: 2.0,
                            ),
                          ],
                        ),
                        Text('Tried their pizza and chicken pinyasarsa and I '
                            'love it very very very much.'),
                        SizedBox(height: 20),
                        TextButton(onPressed: () {}, child: Text('VIEW ALL'))
                      ])
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
