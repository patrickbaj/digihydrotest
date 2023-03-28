import 'package:digihydro/mainpages/greenhouse_screen.dart';
import 'package:digihydro/mainpages/plants_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
void dropdownCallback(String? selectedValue) {
  if (selectedValue is String) {
    setState(() {
      _dropdownValue = selectedValue;
    });
  }
}*/

class DropDownGH extends StatefulWidget {
  @override
  addGH createState() => addGH();
}

class addGH extends State<DropDownGH> {
  var _plantType = [
    "Choose Device",
    "Device 1",
  ];
  var _selectedVal = "Choose Device";

  //addPlant() {
  //  _selectedVal = _plantType[0];
  //}
  String value = "";
  var Dates = ['10/25/2020', '10/26/2020', '10/27/2020', '10/28/2020'];
  var _current = '10/25/2020';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 237, 220),
      appBar: AppBar(
        title: Container(
          child: Text(
            "Add Greenhouse",
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
                        "Greenhouse Information",
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
                  "Greenhouse Name",
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
                  //obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Greenhouse Name",
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
              /*Container(
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
                  //obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Plant Variety",
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),*/
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  "IoT Device",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 40, right: 40),
                width: 370,
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      items: _plantType.map((String dropItems) {
                        return DropdownMenuItem<String>(
                          value: dropItems,
                          child: Text(dropItems),
                        );
                      }).toList(),
                      onChanged: null, //(String newvalSelect) {
                      //  setState(() {
                      //    this._selectedVal = newvalSelect;
                      //  });
                      //},
                      value: _selectedVal,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                  //style: BorderStyle.solid,
                  width: 1.0,
                )),
              ),
              /*Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: DropdownButton(
                  value: _selectedVal,
                  items: _plantType
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: null,
                ),
              ),*/
              /*Container(
                margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 15,
                  ),
                  decoration: new InputDecoration(
                    hintText: "Enter Batch Name",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),*/
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => greenhPage()));
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
