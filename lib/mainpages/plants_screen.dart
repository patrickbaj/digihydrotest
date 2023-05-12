import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/create/add_plant.dart';
import 'package:digihydro/drawer_screen.dart';
import 'package:flutter/material.dart';

class plantPage extends StatefulWidget {
  @override
  plant createState() => plant();
}

class plant extends State<plantPage> {
  final auth = FirebaseAuth.instance;
  late String currentUserID;
  final ref = FirebaseDatabase.instance.ref('Plants');

  @override
  void initState() {
    //init();
    super.initState();
    final currentUser = auth.currentUser;
    if (currentUser != null) {
      currentUserID = currentUser.uid;
    }
  }

  /*
  init() async {
    String deviceToken = await getDeviceToken();
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
    });
  }

  //for notifs
  Future getDeviceToken() async {
    FirebaseMessaging _firebaseMessage = FirebaseMessaging.instance;
    String? deviceToken = await _firebaseMessage.getToken();
    return (deviceToken == null) ? "" : deviceToken;
  }*/

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
            child: FirebaseAnimatedList(
              query: ref.orderByChild('userId').equalTo(currentUserID),
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Color(0xFF030303);
                return Wrap(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                              Text(snapshot.child('batchName').value.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          Row(
                            children: [Text(' ')],
                          ),
                          Row(
                            children: [
                              Text(
                                  'Plant Type: ' +
                                      snapshot
                                          .child('plantType')
                                          .value
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  'Plant Variety: ' +
                                      snapshot
                                          .child('plantVar')
                                          .value
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  'Grow Method: ' +
                                      snapshot
                                          .child('growMethod')
                                          .value
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  'Nutrient Solution: ' +
                                      snapshot
                                          .child('nutrientSol')
                                          .value
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                  ))
                            ],
                          ),
                          Row(
                            children: [Text(' ')],
                          ),
                          Row(
                            children: [
                              Text(
                                  'Sow Type: ' +
                                      snapshot
                                          .child('sowType')
                                          .value
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  'Sow Date: ' +
                                      snapshot
                                          .child('sowDate')
                                          .value
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                  )),
                            ],
                          ),
                          Row(
                            children: [Text(' ')],
                          ),
                          Row(
                            children: [
                              Text(
                                  'Reservoir: ' +
                                      snapshot.child('reserv').value.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  'Greenhouse: ' +
                                      snapshot
                                          .child('greenhouse')
                                          .value
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                  )),
                            ],
                          ),
                        ],
                      ),

                      /*GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => plantDetails(
                                      snapshot: snapshot,
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
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
                                Text(
                                    snapshot
                                        .child('batchName')
                                        .value
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),*/
                    )
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
