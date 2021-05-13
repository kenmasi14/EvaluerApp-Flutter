import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RateMe extends StatefulWidget {
  @override
  _RateMe createState() => _RateMe();
}

class _RateMe extends State<RateMe> {
  final TextEditingController reviewController = TextEditingController();
  //const RateMe({Key key}) : super(key: key);
  Icon likeActivated = Icon(Icons.thumb_up, size: 40, color: Colors.blue);
  Icon likeDeactivated = Icon(Icons.thumb_up_outlined, size: 40);
  Icon dislikeActivated = Icon(Icons.thumb_down, size: 40, color: Colors.red);
  Icon dislikeDeactivated = Icon(Icons.thumb_down_outlined, size: 40);

  String _dislike = "Hello";
  var healthProtocols = {
    'lbLike': Icon(Icons.thumb_up, size: 40, color: Colors.blue),
    'lbDislike': Icon(Icons.thumb_down_outlined, size: 40),
    'tcLike': Icon(Icons.thumb_up, size: 40, color: Colors.blue),
    'tcDislike': Icon(Icons.thumb_down_outlined, size: 40),
    'fmLike': Icon(Icons.thumb_up, size: 40, color: Colors.blue),
    'fmDislike': Icon(Icons.thumb_down_outlined, size: 40),
    'fsLike': Icon(Icons.thumb_up, size: 40, color: Colors.blue),
    'fsDislike': Icon(Icons.thumb_down_outlined, size: 40),
    'sdLike': Icon(Icons.thumb_up, size: 40, color: Colors.blue),
    'sdDislike': Icon(Icons.thumb_down_outlined, size: 40),
  };
  var rating = {
    'service': 0.0,
    'food': 0.0,
    'logbook': 1,
    'temperatureCheck': 1,
    'faceMask': 1,
    'faceShield': 1,
    'socialDistancing': 1
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: new AssetImage('assets/images/logo hotel.png'),
                    )),
              ),
              Text(
                'Your opinion matters to us!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
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
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 7,
                    decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    child: Column(children: [
                      Text(
                        'How was their food?',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(height: 5),
                      SmoothStarRating(
                        rating: 0.0,
                        isReadOnly: false,
                        size: 40,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        starCount: 5,
                        allowHalfRating: true,
                        spacing: 2.0,
                        onRated: (v) => setState(() {
                          rating["food"] = v;
                        }),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'How was their Service ?',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(height: 5),
                      SmoothStarRating(
                        rating: 5.0,
                        isReadOnly: false,
                        size: 40,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        starCount: 5,
                        allowHalfRating: true,
                        spacing: 2.0,
                        onRated: (v) => setState(() {
                          rating["service"] = v;
                        }),
                      ),
                      SizedBox(height: 15),
                      Text('Health Protocol Compliance'),
                      SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _dislike,
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              icon: healthProtocols["lbLike"],
                              onPressed: () => setState(() {
                                if (rating["logbook"] == 1) {
                                  healthProtocols["lbLike"] = likeDeactivated;
                                  healthProtocols["lbDislike"] =
                                      dislikeActivated;
                                  rating["logbook"] = 0;
                                } else {
                                  healthProtocols["lbLike"] = likeActivated;
                                  healthProtocols["lbDislike"] =
                                      dislikeDeactivated;
                                  rating["logbook"] = 1;
                                }
                              }),
                            ),
                            IconButton(
                              icon: healthProtocols['lbDislike'],
                              onPressed: () => setState(() {
                                if (rating["logbook"] == 1) {
                                  healthProtocols["lbLike"] = likeDeactivated;
                                  healthProtocols["lbDislike"] =
                                      dislikeActivated;
                                  rating["logbook"] = 0;
                                } else {
                                  healthProtocols["lbLike"] = likeActivated;
                                  healthProtocols["lbDislike"] =
                                      dislikeDeactivated;
                                  rating["logbook"] = 1;
                                }
                              }),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Temperature Check'),
                            IconButton(
                              icon: healthProtocols["tcLike"],
                              onPressed: () => setState(() {
                                if (rating["temperatureCheck"] == 1) {
                                  healthProtocols["tcLike"] = likeDeactivated;
                                  healthProtocols["tcDislike"] =
                                      dislikeActivated;
                                  rating["temperatureCheck"] = 0;
                                } else {
                                  healthProtocols["tcLike"] = likeActivated;
                                  healthProtocols["tcDislike"] =
                                      dislikeDeactivated;
                                  rating["temperatureCheck"] = 1;
                                }
                              }),
                            ),
                            IconButton(
                              icon: healthProtocols['tcDislike'],
                              onPressed: () => setState(() {
                                if (rating["temperatureCheck"] == 1) {
                                  healthProtocols["tcLike"] = likeDeactivated;
                                  healthProtocols["tcDislike"] =
                                      dislikeActivated;
                                  rating["temperatureCheck"] = 0;
                                } else {
                                  healthProtocols["tcLike"] = likeActivated;
                                  healthProtocols["tcDislike"] =
                                      dislikeDeactivated;
                                  rating["temperatureCheck"] = 1;
                                }
                              }),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Face Mask'),
                            IconButton(
                              icon: healthProtocols["tcLike"],
                              onPressed: () => setState(() {
                                if (rating["temperatureCheck"] == 1) {
                                  healthProtocols["tcLike"] = likeDeactivated;
                                  healthProtocols["tcDislike"] =
                                      dislikeActivated;
                                  rating["temperatureCheck"] = 0;
                                } else {
                                  healthProtocols["tcLike"] = likeActivated;
                                  healthProtocols["tcDislike"] =
                                      dislikeDeactivated;
                                  rating["temperatureCheck"] = 1;
                                }
                              }),
                            ),
                            IconButton(
                              icon: healthProtocols['tcDislike'],
                              onPressed: () => setState(() {
                                if (rating["temperatureCheck"] == 1) {
                                  healthProtocols["tcLike"] = likeDeactivated;
                                  healthProtocols["tcDislike"] =
                                      dislikeActivated;
                                  rating["temperatureCheck"] = 0;
                                } else {
                                  healthProtocols["tcLike"] = likeActivated;
                                  healthProtocols["tcDislike"] =
                                      dislikeDeactivated;
                                  rating["temperatureCheck"] = 1;
                                }
                              }),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Social Distancing'),
                            IconButton(
                              icon: healthProtocols["tcLike"],
                              onPressed: () => setState(() {
                                if (rating["temperatureCheck"] == 1) {
                                  healthProtocols["tcLike"] = likeDeactivated;
                                  healthProtocols["tcDislike"] =
                                      dislikeActivated;
                                  rating["temperatureCheck"] = 0;
                                } else {
                                  healthProtocols["tcLike"] = likeActivated;
                                  healthProtocols["tcDislike"] =
                                      dislikeDeactivated;
                                  rating["temperatureCheck"] = 1;
                                }
                              }),
                            ),
                            IconButton(
                              icon: healthProtocols['tcDislike'],
                              onPressed: () => setState(() {
                                if (rating["temperatureCheck"] == 1) {
                                  healthProtocols["tcLike"] = likeDeactivated;
                                  healthProtocols["tcDislike"] =
                                      dislikeActivated;
                                  rating["temperatureCheck"] = 0;
                                } else {
                                  healthProtocols["tcLike"] = likeActivated;
                                  healthProtocols["tcDislike"] =
                                      dislikeDeactivated;
                                  rating["temperatureCheck"] = 1;
                                }
                              }),
                            )
                          ]),
                      SizedBox(height: 25),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [
                              Center(
                                child: Text('Write a Message'),
                              ),
                              TextFormField(
                                controller: reviewController,

                              ),
                            ],
                          )),
                      SizedBox(height: 25),
                      Container(
                          width: double.infinity,
                          height: 30,
                          color: Colors.blue,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.black,
                            child: Text(
                              'Submit here',
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ]),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
