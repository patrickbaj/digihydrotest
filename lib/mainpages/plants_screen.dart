import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/create/add_plant.dart';
import 'package:digihydro/drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:digihydro/details/plant_details.dart';

class homePage extends StatefulWidget{
  @override
  home createState() => home();
}

class home extends State<homePage> {
  final auth = FirebaseAuth.instance;
  late String currentUserID;
  final ref = FirebaseDatabase.instance.ref('Plants');

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

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //endFloat, for padding and location
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 5.0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DropDown1()));
        },
      ), //FloatingButton

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
      body: 
      Column(
        children: [
          Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Icon(
                      Icons.energy_savings_leaf,
                      size: 50,
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                    child: Text(
                      'My Plants',
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
                  query: ref.orderByChild('userId').equalTo(currentUserID),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                   
                    Color myColor = Color(0xFF030303);
                    return Wrap(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => plantDetails(snapshot: snapshot,)));
                          },
                          child: 
                            Container(
                              margin:  EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(snapshot.child('batchName').value.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )
                                      ),
                                    ],
                                  ),
                                  
                                ],
                              ),
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
