import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/create/add_gh.dart';
import 'package:digihydro/drawer_screen.dart';
import 'package:flutter/material.dart';

class greenhPage extends StatefulWidget {
  @override
  green createState() => green();
}

class green extends State<greenhPage> {
  @override
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref();

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //endFloat, for padding and location
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 5.0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DropDownGH()));
        },
      ),

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
                    Icons.house_siding_rounded,
                    size: 50,
                    color: Colors.green,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                  child: Text(
                    'Greenhouse',
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
              query: ref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return Column(
                  children: [
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
          /*Expanded(
            child: StreamBuilder(
              stream:  ref.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent>snapshot){
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }else{
                  Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  list.clear();
                  list = map.values.toList();

                  return ListView.builder(
                    itemCount: snapshot.data!.snapshot.children.length,
                    itemBuilder: (context, int index) {
                  return ListTile(
                    title: Text(list[index]['0'].toString()),
                    subtitle: Text(list[index]['1'].toString()),
                  );
                });
                }
              }
            )
          ),*/
        ],
      ),
    );
  }
}
