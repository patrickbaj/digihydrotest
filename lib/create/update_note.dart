import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digihydro/mainpages/notes_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class UpdateNote extends StatefulWidget {
  final String noteId;
  final String title;
  final String userDate;
  final String note;
  final String imageUrl;

  UpdateNote({
    required this.noteId,
    required this.title,
    required this.userDate,
    required this.note,
    required this.imageUrl,
  });

  @override
  _UpdateNoteState createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
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
  void initState() {
    super.initState();
    title.text = widget.title;
    userDate.text = widget.userDate;
    userNote.text = widget.note;
    imageUrl = widget.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final ref = fb.ref().child('Notes/${widget.noteId}');
    final currentUser = _auth.currentUser;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 237, 220),
      appBar: AppBar(
        title: Container(
          child: Text(
            "Update Note",
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
                      "New Notes",
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
                  ),
                  ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: TextField(
                  controller: userNote,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Note:',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Attach an image (Optional)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        _pickImage();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: _imageFile != null
                    ? Image.file(
                        _imageFile!,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : imageUrl != ''
                        ? Image.network(
                            imageUrl,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : Container(),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: ElevatedButton(
                  child: Text('Update'),
                  onPressed: () async {
                    try {
                      if (title.text != '' && userDate.text != '' && userNote.text != '') {
                        await ref.update({
                          'title': title.text,
                          'date': userDate.text,
                          'note': userNote.text,
                        });
                        if (_imageFile != null) {
                          final firebaseStorageRef = FirebaseStorage.instance
                              .ref()
                              .child('notes_images')
                              .child(widget.noteId);
                          await firebaseStorageRef.putFile(_imageFile!);
                          imageUrl = await firebaseStorageRef.getDownloadURL();
                          await ref.update({
                            'imageUrl': imageUrl,
                          });
                        }
                        Navigator.pop(context, false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please fill all fields!'),
                          backgroundColor: Colors.red,
                        ));
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Failed to update note. Please try again later.'),
                        backgroundColor: Colors.red,
                      ));
                      print(e);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}