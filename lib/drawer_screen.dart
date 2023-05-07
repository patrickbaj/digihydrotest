import 'package:digihydro/profile/profile_1.dart';
import 'package:digihydro/profile/profile_inc.dart';
import 'package:digihydro/settings/settings_screen.dart';
import 'package:digihydro/mainpages/reservoir_screen.dart';
import 'package:digihydro/mainpages/notes_screen.dart';
import 'package:digihydro/mainpages/plants_screen.dart';
import 'package:digihydro/mainpages/device_screen.dart';
import 'package:digihydro/mainpages/old_device_screen.dart';
import 'package:digihydro/mainpages/greenhouse_screen.dart';
import 'package:flutter/material.dart';
import 'index_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';

import 'mainpages/device_screen.dart';

class drawerPage extends StatefulWidget {
  @override
  drawer createState() => drawer();
}

class drawer extends State<drawerPage> {
  final auth = FirebaseAuth.instance;
  late String currentUserID;
  final ref = FirebaseDatabase.instance.ref('Users');

  @override
  void initState() {
    super.initState();
    final currentUser = auth.currentUser;
    if (currentUser != null) {
      currentUserID = currentUser.uid;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Drawer(
        child: ListView(
          //scrollDirection: Axis.vertical,
          //shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: FirebaseAnimatedList(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                query: ref.orderByChild('userId').equalTo(currentUserID),
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return Wrap(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(0, 65, 0, 10),
                        child: Icon(
                          Icons.account_circle,
                          size: 75,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 18, 0, 0),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    snapshot
                                            .child('firstName')
                                            .value
                                            .toString() +
                                        ' ' +
                                        snapshot
                                            .child('lastName')
                                            .value
                                            .toString(),
                                    style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),

                      /*Container(
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
                      ),*/
                    ],
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 55, 0, 0),
              child: TextButton(
                child: Text('Home'),
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
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: TextButton(
                child: Text('OLD Device Screen'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => oldPage()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
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
                      MaterialPageRoute(builder: (context) => plantPage()));
                },
              ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => greenhPage()));
                },
              ),
            ),*/
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
                          builder: (context) => userProfile())); //userProfile()
                },
              ),
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
            ),
          ],
        ), ////// listview/firebaseanimatedlist
      ),
    );
  }
}
