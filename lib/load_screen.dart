import 'dart:async';
import 'package:flutter/material.dart';
import 'index_screen.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<LoadScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => IndexScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 201, 237, 220),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo_load.png',
              width: 300,
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 201, 237, 220),
              strokeWidth: 5,
            )
          ],
        ),
      ),
    );
  }
}
