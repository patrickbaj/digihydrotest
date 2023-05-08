import 'package:digihydro/mainpages/notes_screen.dart';
import 'package:digihydro/mainpages/plants_screen.dart';
import 'package:digihydro/mainpages/reservoir_screen.dart';
import 'package:digihydro/mainpages/device_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/create/add_reser.dart';
import 'package:digihydro/drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dashBoard extends StatefulWidget {
  @override
  welcomeScreen createState() => welcomeScreen();
}

class welcomeScreen extends State<dashBoard> {
  final auth = FirebaseAuth.instance;
  late String currentUserID;
  final ref = FirebaseDatabase.instance.ref('Plants');
  final refReserv = FirebaseDatabase.instance.ref('Reservoir');
  final refDevice = FirebaseDatabase.instance.ref('Devices');

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
      backgroundColor: Color.fromARGB(255, 201, 237, 220),
      //drawer: drawerPage(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        /*iconTheme: const IconThemeData(
          color: Colors.white,
          size: 40.00,
        ),*/
        title: Row(
          children: <Widget>[
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
        actions: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(
              icon: const Icon(
                Icons.warning_sharp,
                color: Colors.amber, //iconColor(snapshot),
                size: 40,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
/*DEVICE CONTAINER */

          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Container(
              height: 210,
              child: FirebaseAnimatedList(
                query: refDevice,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return Wrap(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(Icons.thermostat),
                                      Text(
                                        ' Air Temp',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF4f4f4f),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                      snapshot
                                              .child('Temperature')
                                              .value
                                              .toString()
                                              .replaceAll(
                                                  RegExp(r'[^\d\.]'), '') +
                                          ' °C',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      )),
                                ),
                              ],
                            ),
                            Divider(
                                color: Colors.grey, thickness: 1, indent: 25),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/humidity_percentage_FILL0_wght400_GRAD0_opsz48.png',
                                        height: 24,
                                        width: 24,
                                      ),
                                      Text(
                                        ' Humidity',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF4f4f4f),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                      snapshot
                                              .child('Humidity')
                                              .value
                                              .toString()
                                              .replaceAll(
                                                  RegExp(r'[^\d\.]'), '') +
                                          ' %',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      )),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                              indent: 25,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/dew_point_FILL0_wght400_GRAD0_opsz48.png',
                                        height: 24,
                                        width: 24,
                                      ),
                                      Text(
                                        ' Water Temp',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF4f4f4f),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                      snapshot
                                              .child('WaterTemperature')
                                              .value
                                              .toString()
                                              .replaceAll(
                                                  RegExp(r'[^\d\.]'), '') +
                                          ' °C',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      )),
                                ),
                              ],
                            ),
                            Divider(
                                color: Colors.grey, thickness: 1, indent: 25),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/total_dissolved_solids_FILL0_wght400_GRAD0_opsz48.png',
                                        height: 24,
                                        width: 24,
                                      ),
                                      Text(
                                        ' TDS',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF4f4f4f),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                      snapshot
                                              .child('TotalDissolvedSolids')
                                              .value
                                              .toString()
                                              .replaceAll(
                                                  RegExp(r'[^\d\.]'), '') +
                                          ' PPM',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      )),
                                ),
                              ],
                            ),
                            Divider(
                                color: Colors.grey, thickness: 1, indent: 25),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/water_ph_FILL0_wght400_GRAD0_opsz48.png',
                                        height: 24,
                                        width: 24,
                                      ),
                                      Text(
                                        ' Water Acidity',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF4f4f4f),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                      snapshot
                                              .child('pH')
                                              .value
                                              .toString()
                                              .replaceAll(
                                                  RegExp(r'[^\d\.]'), '') +
                                          ' pH',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      )),
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
          ),

/*MY PLANTS CONTAINER */

          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
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
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'My Plants',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Plant Name',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Greenhouse',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Reservoir',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 139,
                  child: FirebaseAnimatedList(
                    query: ref.orderByChild('userId').equalTo(currentUserID),
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      if (snapshot == null || snapshot.value == null)
                        return SizedBox.shrink();
                      final plantName =
                          snapshot.child('batchName').value?.toString() ?? '';
                      final greenhouse =
                          snapshot.child('greenhouse').value?.toString() ?? '';
                      final reserName =
                          snapshot.child('reserv').value?.toString() ?? '';
                      return ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${index + 1}. ' + plantName,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 14.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          greenhouse,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 14.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          reserName,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

// BUTTONS
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ElevatedButton.icon(
                      // ignore: sort_child_properties_last
                      icon: Icon(
                        Icons.energy_savings_leaf,
                        color: Colors.green,
                        size: 30.0,
                      ),
                      label: const Text(
                        'Plants',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        foregroundColor: Color(0xFF343434), //text color
                        backgroundColor: Color(0xFFb8d4c4), //button color
                        textStyle: const TextStyle(color: Colors.black),
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => plantPage()));
                        //signIn();
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: ElevatedButton.icon(
                      // ignore: sort_child_properties_last
                      icon: Icon(
                        Icons.sticky_note_2_outlined,
                        color: Colors.green,
                        size: 30.0,
                      ),
                      label: const Text(
                        'Notes',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        foregroundColor: Color(0xFF343434),
                        backgroundColor: Color(0xFFb8d4c4),
                        textStyle: const TextStyle(color: Colors.black),
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => notesPage()));
                        //signIn();
                      },
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton.icon(
                  // ignore: sort_child_properties_last
                  icon: Icon(
                    Icons.water,
                    color: Colors.green,
                    size: 30.0,
                  ),
                  label: const Text(
                    'Reservoirs',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    foregroundColor: Color(0xFF343434),
                    backgroundColor: Color(0xFFb8d4c4),
                    textStyle: const TextStyle(color: Colors.black),
                    minimumSize: Size(200, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => reservoirPage()));
                    //signIn();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
