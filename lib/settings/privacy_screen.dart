import 'package:digihydro/drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digihydro/index_screen.dart';

class Switching extends StatefulWidget {
  Switching() : super();
  @override
  _privacyPage createState() => _privacyPage();
}

class _privacyPage extends State<Switching> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;

  onSwitchVal1(bool newVal1) {
    setState(() {
      isSwitched1 = newVal1;
    });
  }

  onSwitchVal2(bool newVal2) {
    setState(() {
      isSwitched2 = newVal2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 201, 237, 220),
        appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
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
            ]
            /*actions: <Widget>[
            Container(
              child: IconButton(
                icon: Icon(Icons.lock, size: 40, color: Colors.white),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 16, 150, 16),
              child: Text(
                "Privacy",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],*/
            ),
        body: Center(
          child: ListView(
            //padding: EdgeInsets.all(10),
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(50, 10, 50, 25),
                child: Image.asset(
                  'images/Logo.png',
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 25, 20, 10),
                    child: Text(
                      'Turn on your Location',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 70, 20),
                    child: Text(
                      'Lorem ipsum dolor sit amet',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(250, 0, 0, 0),
                    child: Transform.scale(
                      scale: 1.3,
                      child: Switch(
                        value: isSwitched1,
                        onChanged: (newVal1) {
                          onSwitchVal1(newVal1);
                        },
                        activeTrackColor: Colors.greenAccent[100],
                        activeColor: Colors.green,
                      ),
                    ),
                  ),
                ]),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey /*[500]*/, spreadRadius: 1),
                  ],
                ),
                height: 175,
              ),
              Container(
                margin: const EdgeInsets.all(15),
                child: Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 25, 20, 10),
                    child: Text(
                      'Lorem dolor sit amet',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 70, 20),
                    child: Text(
                      'Lorem ipsum dolor sit amet',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(250, 0, 0, 0),
                    child: Transform.scale(
                      scale: 1.3,
                      child: Switch(
                        value: isSwitched2,
                        onChanged: (newVal2) {
                          onSwitchVal2(newVal2);
                        },
                        activeTrackColor: Colors.greenAccent[100],
                        activeColor: Colors.green,
                      ),
                    ),
                  ),
                ]),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey /*[500]*/, spreadRadius: 1),
                  ],
                ),
                height: 175,
              ),
            ],
          ),
        ),
        drawer: drawerPage());
  }
}

//edit