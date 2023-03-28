import 'package:digihydro/drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digihydro/index_screen.dart';

class helpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 201, 237, 220),
        appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            iconTheme: const IconThemeData(
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
                icon: Icon(Icons.help, size: 40, color: Colors.white),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 16, 160, 16),
              child: Text(
                "Help",
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
                margin: const EdgeInsets.fromLTRB(40, 40, 40, 10),
                padding: const EdgeInsets.fromLTRB(15, 80, 15, 10),
                child: Text(
                  "How can we help you?",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[100],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.grey[500],
                  boxShadow: [
                    BoxShadow(color: Colors.grey, spreadRadius: 1),
                  ],
                ),
                height: 200,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 20, 5, 0),
                child: Text(
                  'Top Questions',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 15, 40, 10),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "How to change your account password",
                        style: TextStyle(
                          fontSize: 16,
                          //color: Colors.grey[100],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: EdgeInsets.fromLTRB(150, 0, 120, 0),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 2.0, color: Colors.grey)),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Lorem ipsum dolor sit amet consectetur",
                        style: TextStyle(
                          fontSize: 16,
                          //color: Colors.grey[100],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: EdgeInsets.fromLTRB(150, 0, 120, 0),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 2.0, color: Colors.grey)),
                      ),
                    ),
                    Container(
                      child: Text(
                        "sed do eiusmod tempor incididunt ut labore",
                        style: TextStyle(
                          fontSize: 16,
                          //color: Colors.grey[100],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: EdgeInsets.fromLTRB(150, 0, 120, 0),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 2.0, color: Colors.grey)),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Ut enim ad minim veniam, quis nostrud",
                        style: TextStyle(
                          fontSize: 16,
                          //color: Colors.grey[100],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: EdgeInsets.fromLTRB(150, 0, 120, 0),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 2.0, color: Colors.grey)),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Nemo enim ipsam voluptatem quia volup",
                        style: TextStyle(
                          fontSize: 16,
                          //color: Colors.grey[100],
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey, spreadRadius: 1),
                  ],
                ),
                height: 210,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 20, 5, 0),
                child: Text(
                  'New Questions?',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 15, 40, 30),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(children: <Widget>[
                        Text("Send now to "),
                        Text(
                          "digihydro@gmail.com",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18,
                        ),
                        decoration: new InputDecoration(
                          hintText: "Write your question here.",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                        height: 40,
                        width: 150,
                        margin: EdgeInsets.fromLTRB(140, 0, 0, 0),
                        padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
                        child: ElevatedButton(
                            child: Text('Send'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              textStyle: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2,
                              ),
                            ),
                            onPressed: () {
                              //future slot //Index Screen
                            })
                        /*child: RaisedButton(
                            textColor: Colors.white, //
                            color: Colors.redAccent, //
                            child: Text(
                              'Send',
                              style: TextStyle(
                                letterSpacing: 2, //
                              ),
                            ),
                            onPressed: (){
                              //future slot //Index Screen
                            }
                        )*/
                        )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey, spreadRadius: 1),
                  ],
                ),
                height: 210,
              ),
            ],
          ),
        ),
        drawer: drawerPage());
  }
}

//edit
/*
              Table(
                columnWidths: {1: FractionColumnWidth(.2)},
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: <Widget>[
                      new Text(
                        "How to change your account password",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                      children: <Widget>[
                        new Text(
                          "Lorem dolor sit amet consectetur elit, sed",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ]
                  ),
                ],
              ),*/