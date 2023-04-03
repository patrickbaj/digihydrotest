import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/create/add_reser.dart';
import 'package:digihydro/drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class reservoirPage extends StatefulWidget{
  @override
  reserv createState() => reserv();
}


class reserv extends State<reservoirPage> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Reservoir');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //endFloat, for padding and location
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 5.0,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DropDownReserv()));
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
                      Icons.water,
                      size: 50,
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                    child: Text(
                      'Reserviors',
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

                    return Wrap(
                      children: [
                        Container(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(snapshot.child('reservName').value.toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text(' ')
                            ],
                          ),

                          Row(
                            children: [
                              Text('Grow Method: ' + snapshot.child('growMethod').value.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                )
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text('Nutrient Solution: ' + snapshot.child('nutrientSol').value.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                )
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text(' ')
                            ],
                          ),
                          
                          Row(
                            children: [
                              Text('Greenhouse: ' + snapshot.child('greenH').value.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                )
                              ),
                            ],
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
