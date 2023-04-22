import 'package:digihydro/index_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/create/add_gh.dart';
import 'package:digihydro/drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class devicePage extends StatefulWidget{
  @override
  device createState() => device();
}

class device extends State<devicePage> {
  @override
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Devices');
  
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //endFloat, for padding and location
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 5.0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DropDownGH()));
        },
      ),

      backgroundColor: Color.fromARGB(255, 201, 237, 220),
      drawer: drawerPage(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 40.00,
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 15, 0),
            child: Align(
              child: Image.asset(
                'images/logo_white.png',
                scale: 8,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Icon(
                      Icons.devices_outlined,
                      size: 50,
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                    child: Text(
                      'Devices',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: 
            FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                return Wrap(
                       children: [
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
                                    child:
                                      Container(
                                        width: 118,
                                        height: 60,
                                        margin:  EdgeInsets.symmetric(vertical: 10),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Text('Air Temp',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context).primaryColor,
                                              ),
                                            textAlign: TextAlign.center,
                                            ),
                                            Text(snapshot.child('Temperature').value.toString() + ' °c',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Theme.of(context).primaryColor,
                                              )
                                            ),
                                          ],
                                        ),
                                    ),
                                  ),
                
                                  Container(
                                    alignment: Alignment.centerRight,
                                    margin: EdgeInsets.fromLTRB(60, 10, 0, 0),
                                    child:
                                    Container(
                                      width: 118,
                                      height: 60,
                                      margin:  EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Text('Humidity',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          textAlign: TextAlign.center,
                                          ),
                                          Text(snapshot.child('Humidity').value.toString() + ' %',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Theme.of(context).primaryColor,
                                            )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  
                                  ],
                                ),

                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
                                    child:
                                      Container(
                                        width: 118,
                                        height: 60,
                                        margin:  EdgeInsets.symmetric(vertical: 10),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Text('Water Temp',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context).primaryColor,
                                              ),
                                            textAlign: TextAlign.center,
                                            ),
                                            Text(snapshot.child('WaterTemperature').value.toString() + ' °c',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Theme.of(context).primaryColor,
                                              )
                                            ),
                                          ],
                                        ),
                                    ),
                                  ),
                
                                  Container(
                                    alignment: Alignment.centerRight,
                                    margin: EdgeInsets.fromLTRB(60, 10, 0, 0),
                                    child:
                                    Container(
                                      width: 118,
                                      height: 60,
                                      margin:  EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Text('TDS',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          textAlign: TextAlign.center,
                                          ),
                                          Text(snapshot.child('TotalDissolvedSolids').value.toString() + ' PPM',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Theme.of(context).primaryColor,
                                            )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(120, 10, 0, 0),
                                    child: 
                                      Container(
                                      width: 118,
                                      height: 60,
                                      margin:  EdgeInsets.symmetric(vertical: 10),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Text('Water Acidity',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          textAlign: TextAlign.center,
                                          ),
                                          Text(snapshot.child('pH').value.toString() + ' pH',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Theme.of(context).primaryColor,
                                            )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 10,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 15,
                                  ),
                                  decoration: new InputDecoration(
                                    hintText: "Write your note...",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  ],
                );
              },
            ), 
          ),
        ],
      ),
    );
  }
}
