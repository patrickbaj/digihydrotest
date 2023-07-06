import 'dart:math';
import 'package:digihydro/mainpages/notes_screen.dart';
import 'package:digihydro/mainpages/notif.dart';
import 'package:digihydro/mainpages/plants_screen.dart';
import 'package:digihydro/mainpages/reservoir_screen.dart';
import 'package:digihydro/mainpages/device_screen.dart';
import 'package:digihydro/mainpages/history_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class stats extends StatefulWidget{
  @override
  _statscreen createState() =>  _statscreen();
}




class _statscreen extends State<stats>{

  
  final DatabaseReference refDevice = FirebaseDatabase.instance.ref('Devices');
  final DatabaseReference destinationReference = FirebaseDatabase.instance.ref().child('destination');


  Future<void> FetchData() async {
    refDevice.once().then((event) {
                      DataSnapshot snapshot = event.snapshot;
                      Map<dynamic, dynamic>? sourceData = snapshot.value as Map<dynamic, dynamic>?;
                      DateTime now = DateTime.now();
                      String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
                      sourceData!['datetime'] = formattedDateTime;

                      destinationReference.set(sourceData);
                    
                  }).catchError((error) {
                    // Handle any errors that occur during the read operation
                  });
  }

  @override
  Widget build(BuildContext context){
    var rng = Random();
    var num = rng.nextInt(10000);

    //final ref = fb.ref().child('Plants/$num');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 237, 220),
      drawer: drawerPage(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        //automaticallyImplyLeading: false,
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
      body: ListView(
        children: [
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
              height: 270,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 10),
                                  child: Text(
                                    'Realtime Stats',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1a1a1a),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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


//Fetch data sample           
          Container(
            child: ElevatedButton(
              onPressed: () {
                FetchData();
                },
              child: Text('Fetch'),
            ),
          ),

          Container(
            height: 50,
            width: 50,
            child:FirebaseAnimatedList(
              query: destinationReference, 
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index){
                    return Row(
                      children: [
                        Column(
                          children: [
                            Text(snapshot.child('Humidity').value.toString())
                          ],
                        ),
                      ],
                    );
                  }
              )
          ),


//Chart container
          Container(
            height: 300,
            width: 400,
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
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(
                  show: true,
                  border:  Border.all(
                    color: Colors.black, width: 2
                    ),
                ),
                gridData: FlGridData(
                  show: true,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.black,
                      strokeWidth: 1,
                    );
                  },
                  drawVerticalLine: true,
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.black,
                      strokeWidth: 1,
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}