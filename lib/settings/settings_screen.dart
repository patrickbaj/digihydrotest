import 'package:digihydro/drawer_screen.dart';
import 'package:digihydro/profile/profile_inc.dart';
import 'package:digihydro/settings/help_screen.dart';
import 'package:digihydro/settings/privacy_screen.dart';
import 'package:digihydro/profile/profile_1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digihydro/index_screen.dart';

class settingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 201, 237, 220),
        appBar: AppBar(
            backgroundColor: Colors.green,
            /*centerTitle: true,
          title: Text(
            "Settings",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),*/
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
            //padding: EdgeInsets.all(10),
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(50, 10, 50, 40),
                child: Image.asset(
                  'images/Logo.png',
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                alignment: Alignment.topLeft,
                child: Column(children: <Widget>[
                  Container(
                    child: Row(children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                        child: IconButton(
                          icon: Icon(
                            Icons.person,
                            size: 50,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        profile_1())); // do something
                          },
                        ),
                      ),
                      TextButton(
                        child: Text('Account'),
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => profile_IncP()));
                        },
                      ),
                      /*FlatButton(
                                textColor: Colors.grey, //
                                child: Text(
                                  "Account", //
                                  style: TextStyle(
                                    fontSize: 18, //
                                  ),
                                ),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=> profile_1()
                                  ));
                                },
                              ),*/
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(150, 0, 120, 0),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.grey)),
                    ),
                  ),
                ]),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                alignment: Alignment.topLeft,
                child: Column(children: <Widget>[
                  Container(
                    child: Row(children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                        child: IconButton(
                          icon: Icon(
                            Icons.lock,
                            size: 50,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Switching())); // do something
                          },
                        ),
                      ),
                      TextButton(
                        child: Text('Privacy'),
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Switching()));
                        },
                      ),
                      /*FlatButton(
                                textColor: Colors.grey, //
                                child: Text(
                                  "Privacy", //
                                  style: TextStyle(
                                    fontSize: 18, //
                                  ),
                                ),
                                onPressed: (){ //
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context)=> Switching()
                                  ));
                                },
                              ),*/
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    padding: EdgeInsets.fromLTRB(150, 0, 120, 0),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.grey)),
                    ),
                  ),
                ]),
              ),
              /*
              Container(
                margin:  EdgeInsets.fromLTRB(0, 25, 0, 0),
                alignment: Alignment.topLeft,
                child: Column(
                    children: <Widget> [
                      Container(
                        child: Row(
                            children: <Widget> [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.not_interested,
                                    size: 50,
                                  ),
                                  onPressed: () {
                                    // do something
                                  },
                                ),
                              ),
                              FlatButton(
                                textColor: Colors.grey,
                                child: Text(
                                  "Block",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: (){
                                  //button
                                },
                              ),
                            ]
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      padding: EdgeInsets.fromLTRB(150, 0, 120, 0),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 2.0, color: Colors.grey)
                        ),
                      ),
                    ),
                  ]
                ),
              ),
              */
              Container(
                margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                alignment: Alignment.topLeft,
                child: Column(children: <Widget>[
                  Container(
                    child: Row(children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                        child: IconButton(
                          icon: Icon(
                            Icons.help,
                            size: 50,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => helpPage()));
                          },
                        ),
                      ),
                      TextButton(
                        child: Text('Help'),
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => helpPage()));
                        },
                      ),
                      /*FlatButton(
                        textColor: Colors.grey,
                        child: Text(
                          "Help",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => helpPage()));
                        },
                      ),*/
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    padding: EdgeInsets.fromLTRB(150, 0, 120, 0),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.grey)),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        drawer: drawerPage());
  }
}
