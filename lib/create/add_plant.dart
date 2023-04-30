import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/mainpages/plants_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class DropDown1 extends StatefulWidget {
  @override
  addPlant createState() => addPlant();
}

class addPlant extends State<DropDown1> {
  TextEditingController batch = TextEditingController();
  TextEditingController varty = TextEditingController();
  TextEditingController typ = TextEditingController();
  TextEditingController res = TextEditingController();
  TextEditingController greenh = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController userDate = TextEditingController();

  var _value = "-1";
  var _selectedMethod = "-1";
  var _selectedNutrient = "-1";

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var num = rng.nextInt(10000);

    final FirebaseAuth _auth = FirebaseAuth.instance;
    final ref = fb.ref().child('Plants/$num');
    final currentUser = _auth.currentUser;

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
                margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
                child: Text(
                  "Batch Name:",
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
                  "Plant Variety:",
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
                    hintText:
                        'e.g. Lalique Crystal Lettuce, Dabi, Rjik Swan Rex. etc',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  "Plant type:",
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
                  controller: typ,
                  decoration: InputDecoration(
                    hintText: 'e.g. Lettuce, Basil, Cilantro, etc',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  "Reservoir:",
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
                  controller: res,
                  decoration: InputDecoration(
                    hintText: 'Enter Reservoir',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),

              /*Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  "Greenhouse:",
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
                  controller: greenh,
                  decoration: InputDecoration(
                    hintText: 'Enter Greenhouse',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),*/

              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  "Sow Date:",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: TextField(
                  controller: userDate,
                  decoration: InputDecoration(
                    //icon: Icon(Icons.calendar_today_rounded),
                    labelText: 'Enter Date:',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(3000),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        userDate.text =
                            DateFormat('MM-dd-yyyy').format(pickedDate);
                      });
                    }
                  },
                ),
              ),
              /*(Container(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: date,
                  decoration: InputDecoration(
                    labelText: 'Date Today:',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context, 
                      initialDate: DateTime.now(), 
                      firstDate: DateTime(1900), 
                      lastDate: DateTime(3000),
                    );

                    if(pickedDate != null){
                      setState(() {
                        date.text = DateFormat('MM/dd/yyyy').format(pickedDate);
                      });
                    }
                  },
                ),
              ),*/

              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  "Choose Sow type:",
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
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("— Select Sow type —"),
                      value: "-1",
                    ),
                    DropdownMenuItem(
                      child: Text("Direct"),
                      value: "Direct",
                    ),
                    DropdownMenuItem(
                      child: Text("Indirect"),
                      value: "Indirect",
                    ),
                  ],
                  onChanged: (selectedType) {
                    setState(() {
                      _value = selectedType!;
                    });
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  "Choose Growing Method:",
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
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                  value: _selectedMethod,
                  items: [
                    DropdownMenuItem(
                      child: Text("— Select Growing Method —"),
                      value: "-1",
                    ),
                    DropdownMenuItem(
                      child: Text("DFT"),
                      value: "Dft",
                    ),
                    DropdownMenuItem(
                      child: Text("NFT"),
                      value: "Nft",
                    ),
                  ],
                  onChanged: (newMethod) {
                    setState(() {
                      _selectedMethod = newMethod!;
                    });
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  "Choose Nutrient Solution:",
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
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                  value: _selectedNutrient,
                  items: [
                    DropdownMenuItem(
                      child: Text("— Select Nutrient Solution —"),
                      value: "-1",
                    ),
                    DropdownMenuItem(
                      child: Text("SNAP"),
                      value: "SNAP",
                    ),
                    DropdownMenuItem(
                      child: Text("NutriHydro"),
                      value: "NutriHydro",
                    ),
                  ],
                  onChanged: (newNutrient) {
                    setState(() {
                      _selectedNutrient = newNutrient!;
                    });
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(240, 25, 40, 40),
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
                      "plantType": typ.text,
                      "reserv": res.text,
                      "greenhouse": greenh.text,
                      "sowDate": date.text,
                      "sowType": _value,
                      "growMethod": _selectedMethod,
                      "nutrientSol": _selectedNutrient,
                      "userId": currentUser?.uid,
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
