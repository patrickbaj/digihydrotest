import 'package:flutter/material.dart';
import 'package:digihydro/drawer_screen.dart';
import 'profile_2.dart';

class profile_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 237, 220),
      appBar: AppBar(
          backgroundColor: Colors.green,
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
          ]),
      body: Center(
          child: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(40, 40, 40, 10),
            child: Icon(
              Icons.person,
              size: 120,
              color: Colors.grey[100],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(color: Colors.grey /*[400]*/, spreadRadius: 1),
              ],
            ),
            height: 200,
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Center(
                child: Text(
                  "James Luna",
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              )),
          Container(
              child: Center(
                  child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Text(
                  "jjluna@gbox.adnu.edu.ph",
                  style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.grey[500],
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 1, 10, 5),
                child: Text(
                  "Cadlan, Pili, CS",
                  style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.grey[500],
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 1, 10, 5),
                child: Text(
                  "+63 977 745 7113",
                  style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.grey[500],
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 5),
                  height: 35,
                  width: 150,
                  child: ElevatedButton(
                      child: Text('Edit Profile'),
                      style: ElevatedButton.styleFrom(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: 2),
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    profile_2())); //Index Screen
                      })
                  /*child: RaisedButton(
                        textColor: Colors.white, //
                        color: Colors.redAccent, //
                        child: Text('Edit Profile', //
                          style: TextStyle(
                            letterSpacing: 2, //
                          ),
                        ),
                        onPressed: (){ //
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> profile_2()
                          )); //Index Screen
                        }
                      )*/
                  ),
            ],
          )))
        ],
      )),
      drawer: drawerPage(),
    );
  }
}
