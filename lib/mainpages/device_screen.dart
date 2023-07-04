import 'package:digihydro/mainpages/notif.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/drawer_screen.dart';
import 'package:digihydro/index_screen.dart' as index;
import 'package:flutter/material.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

import 'dashboard.dart';

class homePage extends StatefulWidget {
  @override
  device createState() => device();
}

final emptyWidget = Container();

Widget airTempChecker(DataSnapshot snapshot) {
  //print("New Changes 1");

  //var airTemp = double.parse(snapshot.child('Temperature').value.toString());
  var snapValue = snapshot
      .child('Temperature')
      .value
      .toString()
      .replaceAll(RegExp(r'[^\d\.]'), '');
  print("Temperature: " + snapValue);
  var airTemp = double.parse(snapValue);

  //if (airTemp >= 35 || airTemp < 18) {
  if (airTemp >= 35) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Air Temperature is above 95°F (35°C).\n',
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
            text: 'Current temperature: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: snapValue + '°C\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
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
  } else if (airTemp < 18) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Air Temperature is below 65°F (18°C).\n',
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
            text: 'Current temperature: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: snapValue + '°C\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
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
  var snapValue = snapshot
      .child('Humidity')
      .value
      .toString()
      .replaceAll(RegExp(r'[^\d\.]'), '');
  print("Humidity: " + snapValue);
  var humidity = double.parse(snapValue);
  //var humidity = double.parse(snapshot.child('Humidity').value.toString());
  //if (humidity >= 85 || humidity < 50) {
  if (humidity >= 85) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Humidity is above 85% \n',
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
            text: 'Current humidity: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: snapValue + '%\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
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
  } else if (humidity < 50) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Humidity is below 50% \n',
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
            text: 'Current humidity: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: snapValue + '%\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
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
  //var waterTemp =
  //    double.parse(snapshot.child('WaterTemperature').value.toString());
  var snapValue = snapshot
      .child('WaterTemperature')
      .value
      .toString()
      .replaceAll(RegExp(r'[^\d\.]'), '');
  print("WaterTemperature: " + snapValue);
  var waterTemp = double.parse(snapValue);
  //if (waterTemp >= 28 || waterTemp < 20) {
  if (waterTemp >= 28) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Water temperature is above 82°F (28°C).\n',
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
            text: 'Current temperature: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: snapValue + '°C\n',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
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
  } else if (waterTemp < 20) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Water temperature is below 68°F (20°C). \n',
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
            text: 'Current temperature: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: snapValue + '°C\n',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
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
  //var tds =
  //    double.parse(snapshot.child('TotalDissolvedSolids').value.toString());
  var snapValue = snapshot
      .child('TotalDissolvedSolids')
      .value
      .toString()
      .replaceAll(RegExp(r'[^\d\.]'), '');
  print("TotalDissolvedSolids: " + snapValue);
  var tds = double.parse(snapValue);
  //if (tds >= 1500 || tds < 400) {
  if (tds >= 1500) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'TDS is above 1500ppm. \n',
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
            text: 'Current TDS: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: snapValue + 'ppm\n',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
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
  } else if (tds < 400) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'TDS is below 400ppm. \n',
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
            text: 'Current TDS: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: snapValue + 'ppm\n',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
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
  //var acidity = double.parse(snapshot.child('pH').value.toString());
  var snapValue =
      snapshot.child('pH').value.toString().replaceAll(RegExp(r'[^\d\.]'), '');
  print("pH: " + snapValue);
  var acidity = double.parse(snapValue);
  //if (acidity >= 6.5 || acidity < 5.0) {
  if (acidity >= 6.5) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'pH is above 6.5pH. \n',
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
            text: 'Current pH: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: snapValue + ' pH\n',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
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
  } else if (acidity < 5.0) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'pH is below 5.0pH. \n',
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
            text: 'Current pH: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: snapValue + ' pH\n',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
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
    /*Notif.showNotif(
        title: "DEVICESCREENYour plants are in danger!",
        body:
            'Check on your reservoir and follow the suggestions to save them!',
        fln: localNotif);*/
    //index.alertCheck = 1;
    return Colors.red;
  } else {
    //index.alertCheck = 0;
    return Colors.grey;
  }
}

class device extends State<homePage> {
  @override
  final auth = FirebaseAuth.instance;
  late String currentUserID;
  final ref = FirebaseDatabase.instance.ref('Devices');

  @override
  void initState() {
    init();
    super.initState();
    //Notif.initialize(localNotif); //FOR NOTIFS
    final currentUser = auth.currentUser;
    if (currentUser != null) {
      currentUserID = currentUser.uid;
    }
  }

  init() async {
    /*String deviceToken = await getDeviceToken();
    print("%%%%%%%%%%%%%% DEVICE TOKEN %%%%%%%%%%%%%%%%");
    print(deviceToken);
    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");

    //notif on click
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      String? title = remoteMessage.notification!.title;
      String? desc = remoteMessage.notification!.body;

      //for in app
      Alert(
        context: context,
        type: AlertType.error,
        title: title,
        desc: desc,
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    });*/
  }

  /*//for notifs
  Future getDeviceToken() async {
    FirebaseMessaging _firebaseMessage = FirebaseMessaging.instance;
    String? deviceToken = await _firebaseMessage.getToken();
    return (deviceToken == null) ? "" : deviceToken;
  }*/

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
                            margin: const EdgeInsets.fromLTRB(100, 15, 5, 10),
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
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
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
                            //mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Realtime Stats',
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text('Air Temp\n',
                                          textAlign: TextAlign.start),
                                      Text('Humidity\n',
                                          textAlign: TextAlign.left),
                                      Text('Water Temp\n',
                                          textAlign: TextAlign.end),
                                      Text('TDS\n', textAlign: TextAlign.start),
                                      Text('pH Level\n',
                                          textAlign: TextAlign.left),
                                    ],
                                  ), //for captions
                                  Column(), //for data
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
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
                                                  .toString()
                                                  .replaceAll(
                                                      RegExp(r'[^\d\.]'), '') +
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
                                                  .toString()
                                                  .replaceAll(
                                                      RegExp(r'[^\d\.]'), '') +
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
                                                  .toString()
                                                  .replaceAll(
                                                      RegExp(r'[^\d\.]'), '') +
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
                                                  .toString()
                                                  .replaceAll(
                                                      RegExp(r'[^\d\.]'), '') +
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
                                                  .toString()
                                                  .replaceAll(
                                                      RegExp(r'[^\d\.]'), '') +
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
  } //
}
