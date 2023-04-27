import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:firebase_messaging/firebase_messaging.dart";
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'load_screen.dart';
//import 'doctors_appointment.dart';
//import 'privacy_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(digihydro());
}

class digihydro extends StatefulWidget {
  @override
  loginScreen createState() => loginScreen();
}

class loginScreen extends State<digihydro> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoadScreen(),
    );
  }
}
