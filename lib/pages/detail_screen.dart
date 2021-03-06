import 'package:evaluer_app/Widget/detail_grid.dart';
import 'package:flutter/material.dart';

class ScreenBoard extends StatelessWidget {
  static const routeName = '/detail-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        )
                      ]),
                  child: Image(
                    image: new AssetImage('assets/images/Hotel.jpg'),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'SIKATUNA BEACH HOTEL',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        ' San Jose, Occidental Mindoro',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                color: Colors.orange[800],
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    'The hotel offers guests a range of services and amenities designed to provide comfort and convenience. All the necessary facilities, including free Wi-Fi in all rooms, 24-hour front desk, Wi-Fi in public areas, car park, room service, are at hand. Guestrooms are designed to provide an optimal level of comfort with welcoming decor and some offering convenient amenities like air conditioning, desk, balcony/terrace, internet access – wireless (charges apply), television. The hotel offers various recreational opportunities. Friendly staff, great facilities and close proximity to all that San Jose (Mindoro Occidental) has to offer are three great reasons you should stay at Sikatuna Beach Hotel.',
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.0, color: Colors.white,),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GridView.count(
              primary: false,
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              children: [
                for (var stories in stores)
                  Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: new AssetImage('assets/images/$stories.jpg'),
                          fit: BoxFit.cover,
                        )),
                  )
              ],
            ),
            SizedBox(height: 20)
          ]),
        ),
      ),
    );
  }
}
