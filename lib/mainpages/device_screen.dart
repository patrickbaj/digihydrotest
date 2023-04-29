import 'package:digihydro/index_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class devicePage extends StatefulWidget {
  @override
  device createState() => device();
}

final emptyWidget = Container();
Widget airTempChecker(DataSnapshot snapshot) {
  var airTemp = double.parse(snapshot.child('Temperature').value.toString());
  if (airTemp >= 35 || airTemp < 18) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text:
                'Air Temperature is below 65°F (18°C) or above 95°F (35°C).\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Warning: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                'Greenhouse air temperature is out of range. Current temperature: ' +
                    snapshot.child('Temperature').value.toString() +
                    ' °C' +
                    '\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: 'Suggestion: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Adjust the cooling system, shading or increase ventilation. Inspect drafts, malfunctioning equipment, or improperly sealed windows/doors.' +
                'Use Reflective materials or shade cloth to reduce heat during the day. Misting is encouraged of conditions humidity levels are not in danger levels and time is before 5pm.\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  } else {
    return emptyWidget;
  }
}

Widget humidityChecker(DataSnapshot snapshot) {
  var humidity = double.parse(snapshot.child('Humidity').value.toString());
  if (humidity >= 85 || humidity < 50) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Humidity is below 50% or above 85% \n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Warning: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                'Greenhouse humidity level is out of range.Current humidity: ' +
                    snapshot.child('Humidity').value.toString() +
                    '%' +
                    '\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: 'Suggestion: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Adjust the humidifier/dehumidifier settings or increase/decrease ventilation.' +
                'Check for water leaks or excess moisture sources. Install a moisture-absorbing material like silica gel if necessary. Misting is not recommended as it may encourage fungal growth.\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  } else {
    return emptyWidget;
  }
}

Widget waterTempChecker(DataSnapshot snapshot) {
  var waterTemp =
      double.parse(snapshot.child('WaterTemperature').value.toString());
  if (waterTemp >= 28 || waterTemp < 20) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text:
                'Water temperature is below 68°F (20°C) or above 82°F (28°C). \n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Warning: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                'Reservoir water temperature is out of range. Current water temperature: ' +
                    snapshot.child('WaterTemperature').value.toString() +
                    ' °C' +
                    '\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: 'Suggestion: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                'Adjust the water chiller settings, add insulation to the reservoir, or relocate it to a cooler/shaded area. Check equipment for malfunctions.' +
                    'Use a light-colored container to reduce heat absorption.\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  } else {
    return emptyWidget;
  }
}

Widget tdsChecker(DataSnapshot snapshot) {
  var tds =
      double.parse(snapshot.child('TotalDissolvedSolids').value.toString());
  if (tds >= 1500 || tds < 400) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'TDS is below 400 ppm or above 1500 ppm. \n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Warning: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Reservoir TDS level is out of range. Current TDS: ' +
                snapshot.child('TotalDissolvedSolids').value.toString() +
                ' PPM' +
                '\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: 'Suggestion: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'For high TDS, dilute nutrient solution with water or replace it. For low TDS, add more nutrients.' +
                'Check dosing equipment for proper function. Use a TDS meter for accurate measurements.\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  } else {
    return emptyWidget;
  }
}

Widget acidityChecker(DataSnapshot snapshot) {
  var acidity = double.parse(snapshot.child('pH').value.toString());
  if (acidity >= 6.5 || acidity < 5.0) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'pH is below 5.0 pH or above 6.5 pH. \n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Warning: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Reservoir pH level is out of range. Current pH: ' +
                snapshot.child('pH').value.toString() +
                ' pH' +
                '\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: 'Suggestion: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'For high pH, add pH down solution (phosphoric/nitric acid). For low pH, add pH up solution (potassium hydroxide).' +
                'Test and adjust pH gradually. Use a digital pH meter for precise readings.\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  } else {
    return emptyWidget;
  }
}

Color iconColor(DataSnapshot snapshot) {
  if (airTempChecker(snapshot) != emptyWidget ||
      humidityChecker(snapshot) != emptyWidget ||
      waterTempChecker(snapshot) != emptyWidget ||
      tdsChecker(snapshot) != emptyWidget ||
      acidityChecker(snapshot) != emptyWidget) {
    return Colors.red;
  } else {
    return Colors.grey;
  }
}

class device extends State<devicePage> {
  @override
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Devices');

  Widget build(BuildContext context) {
    return Scaffold(
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
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return Wrap(
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
                          Container(
                            margin: const EdgeInsets.fromLTRB(90, 15, 5, 10),
                            child: GestureDetector(
                              child: Icon(
                                Icons.warning_sharp,
                                color: iconColor(snapshot),
                                size: 40,
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            airTempChecker(snapshot),
                                            humidityChecker(snapshot),
                                            waterTempChecker(snapshot),
                                            tdsChecker(snapshot),
                                            acidityChecker(snapshot),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
                                child: Container(
                                  width: 118,
                                  height: 60,
                                  margin: EdgeInsets.symmetric(vertical: 10),
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
                                      Text(
                                        'Air Temp',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                          snapshot
                                                  .child('Temperature')
                                                  .value
                                                  .toString() +
                                              ' °c',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.fromLTRB(60, 10, 0, 0),
                                child: Container(
                                  width: 118,
                                  height: 60,
                                  margin: EdgeInsets.symmetric(vertical: 10),
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
                                      Text(
                                        'Humidity',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                          snapshot
                                                  .child('Humidity')
                                                  .value
                                                  .toString() +
                                              ' %',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
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
                                child: Container(
                                  width: 118,
                                  height: 60,
                                  margin: EdgeInsets.symmetric(vertical: 10),
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
                                      Text(
                                        'Water Temp',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                          snapshot
                                                  .child('WaterTemperature')
                                                  .value
                                                  .toString() +
                                              ' °c',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.fromLTRB(60, 10, 0, 0),
                                child: Container(
                                  width: 118,
                                  height: 60,
                                  margin: EdgeInsets.symmetric(vertical: 10),
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
                                      Text(
                                        'TDS',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                          snapshot
                                                  .child('TotalDissolvedSolids')
                                                  .value
                                                  .toString() +
                                              ' PPM',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
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
                                child: Container(
                                  width: 118,
                                  height: 60,
                                  margin: EdgeInsets.symmetric(vertical: 10),
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
                                      Text(
                                        'Water Acidity',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                          snapshot
                                                  .child('pH')
                                                  .value
                                                  .toString() +
                                              ' pH',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          /*Container(
                            child: GestureDetector(
                              child: Icon(
                                Icons.warning_sharp,
                                color: iconColor(snapshot),
                                size: 40,
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            airTempChecker(snapshot),
                                            humidityChecker(snapshot),
                                            waterTempChecker(snapshot),
                                            tdsChecker(snapshot),
                                            acidityChecker(snapshot),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),*/
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
