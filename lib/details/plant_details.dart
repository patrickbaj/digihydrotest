import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/create/add_gh.dart';
import 'package:flutter/material.dart';

class plantDetails extends StatelessWidget {
  final DataSnapshot snapshot;
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Plants');
  final String currentUserID = FirebaseAuth.instance.currentUser?.uid ?? '';

  plantDetails({required this.snapshot});

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
                    Icons.energy_savings_leaf,
                    size: 50,
                    color: Colors.green,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                  child: Text(
                    'Plant Details',
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
              query: ref.orderByChild('userId').equalTo(currentUserID),
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.child('batchName').value.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Plant Type: ' +
                            snapshot.child('plantType').value.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Plant Variety: ' +
                            snapshot.child('plantVar').value.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Grow Method: ' +
                            snapshot.child('growMethod').value.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Nutrient Solution: ' +
                            snapshot.child('nutrientSol').value.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Sow Type: ' +
                            snapshot.child('sowType').value.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Sow Date: ' +
                            snapshot.child('sowDate').value.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Reservoir: ' +
                            snapshot.child('reserv').value.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Greenhouse: ' +
                            snapshot.child('greenhouse').value.toString(),
                        style: TextStyle(fontSize: 16),
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
