import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:digihydro/mainpages/plants_screen.dart';
import 'package:digihydro/mainpages/reservoir_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';



class DropDownReserv extends StatefulWidget {
  @override
  addReserv createState() => addReserv();
}

class addReserv extends State<DropDownReserv> {
 
  TextEditingController reserv = TextEditingController();
  TextEditingController greenh = TextEditingController();

  var _selectedMethod = "-1";
  var _selectedNutrient = "-1";
  
  final fb = FirebaseDatabase.instance;


  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var num = rng.nextInt(10000);

    final ref = fb.ref().child('Reservoir/$num');

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 237, 220),
      appBar: AppBar(
        title: Container(
          child: Text(
            "Add Reservoir",
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
                        "Reservoir Information",
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
              
              Container(
                margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Text(
                  "Reservoir Name:",
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
                  controller: reserv,
                  decoration: InputDecoration(
                    hintText: "Enter Reservoir Name",
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
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
                    DropdownMenuItem(child: Text("-Select Growing Method-"), value: "-1",),
                    DropdownMenuItem(child: Text("Dft"), value: "Dft",),
                    DropdownMenuItem(child: Text("Nft"), value: "Nft",),
                  ],
                  onChanged:(newMethod){
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
                    DropdownMenuItem(child: Text("-Select Nutrient Solution-"), value: "-1",),
                    DropdownMenuItem(child: Text("SNAP"), value: "SNAP",),
                    DropdownMenuItem(child: Text("NutriHydro"), value: "NutriHydro",),
                  ],
                  onChanged:(newNutrient){
                    setState(() {
                      _selectedNutrient = newNutrient!;
                    });
                  },
                ),
              ),

              Container(
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
                    hintText: "Enter Greenhouse",
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),

              
              Container(
                margin: EdgeInsets.fromLTRB(240, 25, 40, 0),
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
                      "reservName": reserv.text,
                      "greenH": greenh.text,
                      "growMethod": _selectedMethod,
                      "nutrientSol": _selectedNutrient,
                    }).asStream();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => reservoirPage()));
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
