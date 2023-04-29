import 'package:digihydro/profile/profile_1.dart';
import 'package:digihydro/profile/profile_inc.dart';
import 'package:digihydro/settings/settings_screen.dart';
import 'package:digihydro/mainpages/reservoir_screen.dart';
import 'package:digihydro/mainpages/notes_screen.dart';
import 'package:digihydro/mainpages/plants_screen.dart';
import 'package:digihydro/mainpages/greenhouse_screen.dart';
import 'package:flutter/material.dart';
import 'index_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'mainpages/device_screen.dart';

class drawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(0, 65, 0, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Icon(
                        Icons.account_circle,
                        size: 75,
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 18, 0, 0),
                      child: Text(
                        'User Name',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                        ),
                      ),
                      /*child: TextButton(
                        child: Text('User Name'),
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 26,
                          ),
                        ),
                        onPressed: () {
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => profile_1()));*/
                        },
                      ),*/
                    ),
                    /*Container(
                      child: Text(
                        "User Name",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.grey[500],
                        ),
                      ),
                    )*/
                  ],
                )),
            Container(
              margin: EdgeInsets.fromLTRB(0, 55, 0, 0),
              child: TextButton(
                child: Text('Plants'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homePage()));
                },
              ),
              /*child: FlatButton(
                textColor: Colors.grey, // 
                child: Text(
                  "Home", //
                  style: TextStyle(
                    fontSize: 18, //
                  ),
                ),
                onPressed: () { //
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homePage()));
                },
              ),*/
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: TextButton(
                child: Text("Reservoir"),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => reservoirPage()));
                },
              ),
              /*child: FlatButton(
                textColor: Colors.grey, //
                child: Text(
                  "Doctor's Appointment", //
                  style: TextStyle(
                    fontSize: 18, //
                  ),
                ),
                onPressed: () { //
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DropDown()));
                },
              ),*/
            ),
            /*Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: TextButton(
                child: Text('Greenhouse'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  // Home
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => greenhPage()));
                },
              ),
              /*child: FlatButton(
                textColor: Colors.grey, //
                child: Text(
                  "Profile", //
                  style: TextStyle(
                    fontSize: 18, //
                  ),
                ),
                onPressed: () { //
                  // Home
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => profile_IncPage()));
                },
              ),*/
            ),*/
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: TextButton(
                child: Text('Devices'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  // Home
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => devicePage()));
                },
              ),
              /*child: FlatButton(
                textColor: Colors.grey, //
                child: Text(
                  "Profile", //
                  style: TextStyle(
                    fontSize: 18, //
                  ),
                ),
                onPressed: () { //
                  // Home
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => profile_IncPage()));
                },
              ),*/
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: TextButton(
                child: Text('Notes'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  // Home
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => notesPage()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: TextButton(
                child: Text('My Profile'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => profile_1())); //userProfile()
                },
              ),
              /*child: FlatButton(
                textColor: Colors.grey, //
                child: Text(
                  "Settings", //
                  style: TextStyle(
                    fontSize: 18, //
                  ),
                ),
                onPressed: () { //
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => settingsPage()
                          // Home
                          ));
                },
              ),*/
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 23, 0, 0),
              child: ElevatedButton(
                child: Text('Sign Out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.all(23),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => IndexScreen()));
                },
              ),
              /*child: RaisedButton(
                color: Colors.redAccent,
                padding: EdgeInsets.all(23),
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>IndexScreen()
                  ));
                },
                //color: Colors.grey,
              ),*/
            ),
          ],
        ),
      ),
    );
  }
}
