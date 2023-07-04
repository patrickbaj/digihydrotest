import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/create/create_note.dart';
import 'package:digihydro/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class notesPage extends StatefulWidget {
  @override
  displayNote createState() => displayNote();
}

class displayNote extends State<notesPage> {
  final auth = FirebaseAuth.instance;
  late String currentUserID;
  late String imageUrl;
  final ref = FirebaseDatabase.instance.ref('Notes');
  var k;

  TextEditingController title = TextEditingController();
  TextEditingController userDate = TextEditingController();
  TextEditingController userNote = TextEditingController();

  String imageUrl2 = '';

  File? _imageFile;

  Future<void> _pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        imageUrl2 = '';
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

  upd() async {
    DatabaseReference ref1 = FirebaseDatabase.instance.ref("Notes/$k");

// Only update the name, leave the age and address!
    await ref1.update({
      "title": title.text,
      "date": userDate.text,
      "userNote": userNote.text,
      "imageUrl": imageUrl2,
    });
    title.clear();
    userDate.clear();
    userNote.clear();
    imageUrl2 = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            /*child: IconButton(
                  icon: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => profile_IncPage()));
                  },
                ),*/
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Icon(
                          Icons.sticky_note_2_outlined,
                          size: 50,
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                        child: Text(
                          'My Notes',
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
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: [
                Container(
                  child: Icon(
                    Icons.account_circle,
                    size: 50,
                    color: Colors.grey[500],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(
                      "What's on your mind?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => createNote()));
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: FirebaseAnimatedList(
                  query: ref.orderByChild('userId').equalTo(currentUserID),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    String imageUrl =
                        snapshot.child('imageUrl').value.toString();
                    Map note = snapshot.value as Map;
                    note['key'] = snapshot.key;
                    return Wrap(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      snapshot.child('title').value.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      snapshot.child('date').value.toString(),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [Text(' ')],
                              ),
                              Column(
                                children: [
                                  Text(
                                      snapshot
                                          .child('userNote')
                                          .value
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Theme.of(context).primaryColor,
                                      )),
                                ],
                              ),
                              Row(
                                children: [Text(' ')],
                              ),
                              Row(
                                children: [
                                  Image.network(
                                    imageUrl,
                                    height: 300,
                                    width: 300,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        onPressed: () {
                                          ref.child(snapshot.key!).remove();
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: Icon(
                                          Icons.edit,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            k = snapshot.key;
                                          });
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      TextField(
                                                        controller: title,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'Title:',
                                                          border:
                                                              OutlineInputBorder(),
                                                          isDense: true,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      TextField(
                                                        controller: userDate,
                                                        decoration:
                                                            InputDecoration(
                                                          icon: Icon(Icons
                                                              .calendar_today_rounded),
                                                          labelText:
                                                              'Date Today:',
                                                          border:
                                                              OutlineInputBorder(),
                                                          isDense: true,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                        ),
                                                        onTap: () async {
                                                          DateTime? pickedDate =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1900),
                                                            lastDate:
                                                                DateTime(3000),
                                                          );

                                                          if (pickedDate !=
                                                              null) {
                                                            setState(() {
                                                              userDate
                                                                  .text = DateFormat(
                                                                      'MM-dd-yyyy')
                                                                  .format(
                                                                      pickedDate);
                                                            });
                                                          }
                                                        },
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      TextField(
                                                        controller: userNote,
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        maxLines: 10,
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontSize: 15,
                                                        ),
                                                        decoration:
                                                            new InputDecoration(
                                                          hintText:
                                                              "Write your note...",
                                                          border:
                                                              OutlineInputBorder(),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                IconButton(
                                                                  onPressed:
                                                                      _pickImage,
                                                                  icon: Icon(Icons
                                                                      .add_a_photo_outlined),
                                                                  iconSize: 40,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.15),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    child: Text("Cancel"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text("Update"),
                                                    onPressed: () async {
                                                      if (_imageFile != null) {
                                                        String id = DateTime
                                                                .now()
                                                            .millisecondsSinceEpoch
                                                            .toString();
                                                        final imageRoot =
                                                            FirebaseStorage
                                                                .instance
                                                                .ref();
                                                        final imageRef =
                                                            imageRoot.child(
                                                                'Images');
                                                        final imageUpload =
                                                            imageRef.child(id);
                                                        try {
                                                          await imageUpload
                                                              .putFile(
                                                                  _imageFile!);
                                                          imageUrl2 =
                                                              await imageUpload
                                                                  .getDownloadURL();
                                                        } catch (error) {}
                                                      }
                                                      await upd();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
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
        ],
      ),
    );
  }
}
