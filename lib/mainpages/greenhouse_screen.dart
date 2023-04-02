import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/create/add_gh.dart';
import 'package:digihydro/drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class greenhPage extends StatefulWidget{
  @override
  green createState() => green();
}

class green extends State<greenhPage> {
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
                      Icons.house_siding_rounded,
                      size: 50,
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                    child: Text(
                      'Greenhouses',
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
            child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                    /*return ListTile(
                      title:  Text('Air Temperature: ' + snapshot.child('airTemp').value.toString()),
                      subtitle: Text('Humidity: ' + snapshot.child('humid').value.toString()),
                );*/
                  return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Air Temperature: ' + snapshot.child('airTemp').value.toString() + ' °c',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                )
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text('Humidity: ' + snapshot.child('humid').value.toString() + ' %',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                )
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text('Acidity: ' + snapshot.child('ph').value.toString() + ' pH',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                )
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text('TDS: ' + snapshot.child('tds').value.toString() + ' PPM',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                )
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text('Water Temperature: ' + snapshot.child('waterTemp').value.toString() + ' °c',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                  );
              },
            ), 
          ),
        ],
      ),
    );
  }
}
