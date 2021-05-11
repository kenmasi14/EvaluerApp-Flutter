import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RateMe extends StatelessWidget {
  const RateMe({Key key}) : super(key: key);

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
                'Youre Opinion matter to us',
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
                        'How was their Food ?',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(height: 5),
                      SmoothStarRating(
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
                      SizedBox(height: 15),
                      Text(
                        'How was their Service ?',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(height: 5),
                      SmoothStarRating(
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
                      SizedBox(height: 15),
                      Text('Health Protocol Compliance'),
                      SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('LogBook                   '),
                            SmoothStarRating(
                              rating: 1.0,
                              isReadOnly: false,
                              size: 40,
                              filledIconData: Icons.thumb_up_alt_outlined,
                              defaultIconData: Icons.thumb_up,
                              starCount: 1,
                              allowHalfRating: true,
                              spacing: 2.0,
                            ),
                            SmoothStarRating(
                              rating: 1.0,
                              isReadOnly: false,
                              size: 40,
                              filledIconData: Icons.thumb_down_alt_outlined,
                              defaultIconData: Icons.thumb_down,
                              starCount: 1,
                              allowHalfRating: true,
                              spacing: 2.0,
                            ),
                          ]
                          ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Temperature Check'),
                            SmoothStarRating(
                              rating: 1.0,
                              isReadOnly: false,
                              size: 40,
                              filledIconData: Icons.thumb_up_alt_outlined,
                              defaultIconData: Icons.thumb_up,
                              starCount: 1,
                              allowHalfRating: true,
                              spacing: 2.0,
                            ),
                            SmoothStarRating(
                              rating: 1.0,
                              isReadOnly: false,
                              size: 40,
                              filledIconData: Icons.thumb_down_alt_outlined,
                              defaultIconData: Icons.thumb_down,
                              starCount: 1,
                              allowHalfRating: true,
                              spacing: 2.0,
                            ),
                          ]
                          ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Face Mask                '),
                            SmoothStarRating(
                              rating: 1.0,
                              isReadOnly: false,
                              size: 40,
                              filledIconData: Icons.thumb_up_alt_outlined,
                              defaultIconData: Icons.thumb_up,
                              starCount: 1,
                              allowHalfRating: true,
                              spacing: 2.0,
                            ),
                            SmoothStarRating(
                              rating: 1.0,
                              isReadOnly: false,
                              size: 40,
                              filledIconData: Icons.thumb_down_alt_outlined,
                              defaultIconData: Icons.thumb_down,
                              starCount: 1,
                              allowHalfRating: true,
                              spacing: 2.0,
                            ),
                          ]
                          ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Social Distancing     '),
                            SmoothStarRating(
                              rating: 1.0,
                              isReadOnly: false,
                              size: 40,
                              filledIconData: Icons.thumb_up_alt_outlined,
                              defaultIconData: Icons.thumb_up,
                              starCount: 1,
                              allowHalfRating: true,
                              spacing: 2.0,
                            ),
                            SmoothStarRating(
                              rating: 1.0,
                              isReadOnly: false,
                              size: 40,
                              filledIconData: Icons.thumb_down_alt_outlined,
                              defaultIconData: Icons.thumb_down,
                              starCount: 1,
                              allowHalfRating: true,
                              spacing: 2.0,
                            ),
                          ]
                          ),
                          SizedBox(height: 25),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            child: Column(children: [
                              Center(
                                child: Text('Write a Message'),
                                
                              ),
                              TextFormField(),

                            ],)
                          ),
                          SizedBox(height: 25),

                          Container(
                            width: double.infinity,
                            height: 30,
                            color: Colors.blue,
                            child: RaisedButton(onPressed: () {  }, color: Colors.black,
                            child: Text('Submit here', style: TextStyle(color: Colors.white),),)
                          )
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
