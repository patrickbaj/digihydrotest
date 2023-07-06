import 'dart:convert';

import 'package:digihydro/mainpages/dashboard.dart';
import 'package:digihydro/mainpages/device_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:digihydro/login/signup_screen.dart';
import 'package:digihydro/login/forgot_pass1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class IndexScreen extends StatefulWidget {
  @override
  index createState() => index();
}

class index extends State<IndexScreen> {
  int alertCheck = 0;
  String titleText = "INDEX Your plants are in danger!";
  String bodyText =
      "Check on your reservoir and follow the suggestions to save them!";

  String? itoken = " ";
  final auth = FirebaseAuth.instance;
  final refUser = FirebaseDatabase.instance.ref('Users');
  final refDev = FirebaseDatabase.instance.ref('Devices');
  late String currentUserID;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final userEmail = TextEditingController();
  final userPass = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail.text.trim(),
        password: userPass.text.trim(),
      );
      final currentUser = auth.currentUser;
      if (currentUser != null) {
        currentUserID = currentUser.uid;
      }
      checkAlert();
      errorMessage = '';
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => dashBoard()),
      );
    } on FirebaseAuthException catch (error) {
      //errorMessage = error.message!;
      if (error.code == 'user-not-found') {
        errorMessage = 'No user found for that email';
      } else if (error.code == 'wrong-password') {
        errorMessage = 'Incorrect Password';
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
    //showToken();
    initInfo();
    //checkAlert();
  }

  initInfo() {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/launcher_icon');
    //var iOSInitialize = new IOSInitializationSettings();
    var initializationsSettings = InitializationSettings(
      android: androidInitialize, /*iOS: IOSInitialize*/
    );
    flutterLocalNotificationsPlugin.initialize(initializationsSettings,
        onDidReceiveNotificationResponse: (payload) async {
      /*onSelectNotification: (String? payload) async {*/
      try {
        if (payload != null /*&& payload.isNotEmpty*/) {
        } else {}
      } catch (e) {}
      return;
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("...............Message.................");
      print(
          "onMessage: ${message.notification?.title}/${message.notification?.body}");

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );
      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'DigiHydro',
        'channelName',
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('dhnotif'),
      );
      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, platformChannelSpecifics,
          payload: message.data['title']);
    });
  }

  Future showToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        itoken = token;
        print("Device token is $itoken");
      });
    });
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('Granted provisional permission');
    } else {
      print('Permission denied');
    }
  }

  void sendPushMessage(String token, String body, String title) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAA46Vc9y4:APA91bHBOJsbzLSlquVeeHuiPfsrtKEt0603hsqobh1IH-B5OsWxjpdZELOI5QhdrXKJ7bcJyV3dOZJcAq3Dz7krJy9JJxUgQjHI79mAeqAIBlfHWInhWIgePB7tNOcWqsJ4uHiV92N9', //server key
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': body,
              'title': title,
            },
            "notification": <String, dynamic>{
              "title": title,
              "body": body,
              "android_channel_id": "DigiHydro"
            },
            "to": token,
          },
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print("Error Push Notifs");
      }
    }
  }

  Color colorIndex(DataSnapshot snapshot) {
    if (airTempChecker(snapshot) != emptyWidget ||
        humidityChecker(snapshot) != emptyWidget ||
        waterTempChecker(snapshot) != emptyWidget ||
        tdsChecker(snapshot) != emptyWidget ||
        acidityChecker(snapshot) != emptyWidget) {
      alertCheck = 1;
      return Colors.red;
    } else {
      alertCheck = 0;
      return Colors.grey;
    }
  }

  checkAlert() async {
    if (alertCheck == 1) {
      print(alertCheck);
      DataSnapshot snapUser = await refUser.child(currentUserID).get();
      String token = snapUser.child('token').value.toString();
      print('CHECK ALERT' + token);
      sendPushMessage(token, bodyText, titleText);
    } else {
      print(alertCheck);
    }
  }

  @override
  void dispose() {
    userEmail.dispose();
    userPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 201, 237, 220),
        body: Form(
          key: _key,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FirebaseAnimatedList(
                query: refDev,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return Wrap(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(50, 100, 50, 70),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 20, 0, 10),
                              child: Text(
                                ".",
                                style: TextStyle(color: colorIndex(snapshot)),
                              ),
                            ),
                            Align(
                              child: Image.asset(
                                'images/Logo.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: userEmail,
                          validator: valEmail, //
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            isDense: true,
                            contentPadding: const EdgeInsets.all(15.0),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: userPass,
                          validator: valPass, //
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(15.0),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(65, 0, 0, 0),
                        child: Text(
                          errorMessage,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      /**/
                      Row(children: <Widget>[
                        Container(
                          height: 40,
                          margin: EdgeInsets.fromLTRB(60, 40, 0, 0),
                          child: ElevatedButton(
                            // ignore: sort_child_properties_last
                            child: const Text(
                              'Login',
                              textAlign: TextAlign.center,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: Colors.green,
                              textStyle: const TextStyle(color: Colors.white),
                              minimumSize: Size(100, 50),
                            ),
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                signIn();
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 40, 30, 0),
                          child: TextButton(
                            child: Text('Forgot Password?'),
                            style: TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              textStyle: TextStyle(color: Colors.green),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => forgotPass()));
                            }, // forgot password
                          ),
                        ),
                      ]),
                      Container(
                        height: 140,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(60, 20, 0, 10),
                              child: Text(
                                'Not a user?',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(130, 10, 0, 0),
                              child: ElevatedButton(
                                child: Text('Sign Up'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor:
                                      Color.fromARGB(153, 143, 143, 143),
                                  textStyle:
                                      const TextStyle(color: Colors.grey),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => signupPage()));
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }),
          ),
        ));
  }
}

String? valEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty)
    return 'Email address is required';

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid Email Address';

  return null;
}

String? valPass(String? formPass) {
  if (formPass == null || formPass.isEmpty) return 'Password is required.';
  return null;
}
