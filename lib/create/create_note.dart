import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/mainpages/notes_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class createNote extends StatefulWidget {
  @override
  note createState() => note();
}

class note extends State<createNote> {
  TextEditingController title = TextEditingController();
  TextEditingController userDate = TextEditingController();
  TextEditingController userNote = TextEditingController();

  String imageUrl = '';

  File? _imageFile;

  Future<void> _pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  final fb = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var num = rng.nextInt(10000);

    final FirebaseAuth _auth = FirebaseAuth.instance;
    final ref = fb.ref().child('Notes/$num');
    final currentUser = _auth.currentUser;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 237, 220),
      appBar: AppBar(
        title: Container(
          child: Text(
            "Create Note",
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
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "Add Notes",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    hintText: 'Title:',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: TextField(
                  controller: userDate,
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today_rounded),
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

                    if (pickedDate != null) {
                      setState(() {
                        userDate.text =
                            DateFormat('MM-dd-yyyy').format(pickedDate);
                      });
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: TextField(
                  controller: userNote,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 15,
                  ),
                  decoration: new InputDecoration(
                    hintText: "Write your note...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _pickImage,
                      icon: Icon(Icons.add_a_photo_outlined),
                      iconSize: 40,
                      color: Colors.black.withOpacity(0.15),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    if (_imageFile != null)
                      Image.file(
                        _imageFile!,
                        height: 300,
                        width: 300,
                      )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(200, 25, 30, 0),
                  child: ElevatedButton(
                    child: Text('POST'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      if (_imageFile != null) {
                        String id =
                            DateTime.now().millisecondsSinceEpoch.toString();
                        final imageRoot = FirebaseStorage.instance.ref();
                        final imageRef = imageRoot.child('Images');
                        final imageUpload = imageRef.child(id);
                        try {
                          await imageUpload.putFile(_imageFile!);
                          imageUrl = await imageUpload.getDownloadURL();
                        } catch (error) {}
                      }
                      ref.set({
                        "title": title.text,
                        "date": userDate.text,
                        "userId": currentUser?.uid,
                        "userNote": userNote.text,
                        "imageUrl": imageUrl,
                      }).asStream();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => notesPage()));
                    },
                  )
                  /*child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 10), //
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)), //
                  color: Colors.redAccent, //
                  child: Text(
                    "POST", //
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                ),*/
                  )
            ],
          ),
          //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        ),
      ),
    );
  }
}
