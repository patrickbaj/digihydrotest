import 'package:digihydro/profile/profile_1.dart';
import 'package:flutter/material.dart';

class profile_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 237, 220),
      appBar: AppBar(
          backgroundColor: Colors.green,
          iconTheme: IconThemeData(
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
              color: Colors.grey[400],
              boxShadow: [
                BoxShadow(color: Colors.grey /*[400]*/, spreadRadius: 1),
              ],
            ),
            height: 200,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 5, 5, 10),
            child: Text(
              'Name',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 2,
                color: Colors.grey[600],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(15.0),
                  labelText: 'James Luna',
                  fillColor: Colors.grey[400],
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 5, 5, 10),
            child: Text(
              'Email',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 2,
                color: Colors.grey[600],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            margin: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(15.0),
                  labelText: 'jjluna@gbox.adnu.edu.ph',
                  fillColor: Colors.grey[400],
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 5, 5, 10),
            child: Text(
              'Address',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 2,
                color: Colors.grey[600],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(15.0),
                  labelText: 'Cadlan, Pili, CS',
                  fillColor: Colors.grey[400],
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 5, 5, 10),
            child: Text(
              'Contact Number',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 2,
                color: Colors.grey[600],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            margin: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(15.0),
                  labelText: '+63 977 745 7113',
                  labelStyle: TextStyle(
                    color: Colors.grey[500],
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 5, 5, 10),
            child: Text(
              'Password',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 2,
                color: Colors.grey[600],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding: const EdgeInsets.all(15.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 5, 5, 10),
            child: Text(
              'Confirm Password',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 2,
                color: Colors.grey[600],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding: const EdgeInsets.all(15.0),
              ),
            ),
          ),
          Container(
            height: 100,
            child: Row(
              children: <Widget>[
                Container(
                    height: 45,
                    width: 200,
                    margin: EdgeInsets.fromLTRB(175, 0, 0, 0),
                    padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
                    child: ElevatedButton(
                        child: Text('Save Changes'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2,
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      profile_1())); //Index Screen
                        })
                    /*child: RaisedButton(
                        textColor: Colors.white, //
                        color: Colors.redAccent, //
                        child: Text( //
                          'Save Changes',
                          style: TextStyle(
                            letterSpacing: 2, //
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> profile_1()
                          )); //Index Screen
                        }
                    )*/
                    )
              ],
            ),
          )
        ],
      )),
    );
  }
}
