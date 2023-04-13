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
          Column(
            children: [
              StreamBuilder(
                stream: FirebaseDatabase.instance.ref().child('SensorsData').onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // retrieve data from snapshot
                    DataSnapshot dataValues = snapshot.data!.snapshot;
                    Map<dynamic, dynamic> values = dataValues.value as Map<dynamic, dynamic>;

                    // build a ListView to display the data
                    return SizedBox(
                      height: 300, // set a fixed height
                      child: ListView.builder(
                        itemCount: values.keys.length,
                        itemBuilder: (BuildContext context, int index) {
                          // retrieve data for a single item
                          dynamic key = values.keys.elementAt(index);
                          dynamic value = values[key];

                          // build and return a widget for a single item
                          return Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Column(
                              children: [
                                Text(key.toString()+': ' + value.toString()),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    // display a loading spinner while waiting for data
                    return Container();
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
