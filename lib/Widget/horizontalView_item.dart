
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HorizontalViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                    padding: const EdgeInsets.symmetric(horizontal:10),
                    width: 180,
                    child: GestureDetector(
                      onTap: (){
                      },
                      child: Column(
                        children: <Widget>[
                          Card(
                            elevation: 10,
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage (
                                  fit: BoxFit.cover,
                                  image: new AssetImage('assets/images/Hotel.jpg'),
                                )
                              )
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Sikatuna Beach Hotel', style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
  }
}


