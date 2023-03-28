import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:digihydro/mainpages/plants_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';



class DropDown1 extends StatefulWidget {
  @override
  addPlant createState() => addPlant();
}



class addPlant extends State<DropDown1> {
  var _plantType = [
    "Cucumber",
    "Lettuce",
    "Pechay",
    "Spinach",
    "Basil",
    "Cherry Tomatoes"
  ];
  var _selectedVal = "Cucumber";

  //addPlant() {
  //  _selectedVal = _plantType[0];
  //}
  String value = "";
  var Dates = ['10/25/2020', '10/26/2020', '10/27/2020', '10/28/2020'];
  var _current = '10/25/2020';

  TextEditingController batch = TextEditingController();
  TextEditingController varty = TextEditingController();

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var num = rng.nextInt(10000);

    final ref = fb.ref().child('Plants/$num');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 237, 220),
      appBar: AppBar(
        title: Container(
          child: Text(
            "Add Plant",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ),
      body: Form(
        child: Container(
          //margin: EdgeInsets.fromLTRB(10, 10, 10, 90),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.energy_savings_leaf,
                        size: 50,
                      ),
                      onPressed: () {},
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        "Plant Batch Information",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //
              //
              Container(
                margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Text(
                  "Batch Name",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: batch,
                  decoration: InputDecoration(
                    hintText: 'Enter Batch Name',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  "Plant Variety",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: varty,
                  decoration: InputDecoration(
                    hintText: 'Enter Plant Variety',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
              
              
              Container(
                margin: EdgeInsets.fromLTRB(260, 25, 40, 0),
                child: ElevatedButton(
                  child: Text('ADD'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    textStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    ref.set({
                      "batchName": batch.text,
                      "plantVar": varty.text,
                    }).asStream();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => homePage()));
                  },
                ),
              )
            ],
          ),
          /*
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),*/
        ),
      ),
    );
  }
}
