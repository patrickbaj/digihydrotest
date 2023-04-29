import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/create/add_plant.dart';
import 'package:digihydro/drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';


class userProfile extends StatefulWidget{
  @override
  _userSettings createState() => _userSettings();
}



class _userSettings extends State<userProfile> {
  final auth = FirebaseAuth.instance;
  late String currentUserID;
  final ref = FirebaseDatabase.instance.ref('Users');

  String imageUrl = '';

  File? _imageFile;

  Future<void> _pickImage() async {
    ImagePicker imagePicker = ImagePicker();
      final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
    }
  }

  @override
  void initState() {
    super.initState();
    final currentUser = auth.currentUser;
    if (currentUser != null) {
      currentUserID = currentUser.uid;
    }
  }

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
        body: Form(
          child: Center(
              child: FirebaseAnimatedList(
                query: ref.orderByChild('userId').equalTo(currentUserID),
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                  return Wrap(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        height: 125,
                        color: Colors.grey[500],
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Upload Image"),
                                    content: Text("Would you like to upload an image?"),
                                    actions: [
                                      TextButton(
                                        child: Text("Cancel"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: Text("Upload"),
                                        onPressed: () {
                                          _pickImage();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.person,
                              size: 120,
                              color: Colors.grey[100],
                            ),
                          ),
                        ),
                      ),
                      
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.child('firstName').value.toString(),
                                    style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    )
                                  ),

                                  SizedBox(height: 10),

                                  Text(snapshot.child('lastName').value.toString(),
                                    style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    )
                                  ),

                                  SizedBox(height: 10),

                                  Text(snapshot.child('growerType').value.toString(),
                                    style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    )
                                  ),

                                  SizedBox(height: 10),

                                  Text(snapshot.child('email').value.toString(),
                                    style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    )
                                  ),
                                ],
                              ),   
                          ],
                        ),
                      ),
                    ],
                  );
                }
            )
          ),
        ),
        drawer: drawerPage());
  }
}
