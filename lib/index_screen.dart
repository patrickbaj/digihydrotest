import 'package:flutter/material.dart';
import 'package:digihydro/login/signup_screen.dart';
import 'package:digihydro/login/forgot_pass1.dart';
import 'package:digihydro/mainpages/plants_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class IndexScreen extends StatefulWidget{
  @override
  index createState() => index();
}

class index extends State<IndexScreen> {
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPass = TextEditingController();

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail.text.trim(),
        password: userPass.text.trim(),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => homePage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  void dispose(){
    userEmail.dispose();
    userPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 201, 237, 220),
        body: Form(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(50, 100, 50, 70),
                  child: Align(
                    child: Image.asset(
                      'images/Logo.png',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: userEmail,
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
                  child: TextField(
                    controller: userPass,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(15.0),
                      labelText: 'Password',
                    ),
                  ),
                ),
                TextButton(
                  child: Text('Forgot Password?'),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(160, 0, 0, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    textStyle: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => forgotPass()));
                  }, // forgot password
                  //child: Text('Forgot Password?',
                  //style: TextStyle(color: Colors.grey))
                ),
                /* TextButton(
                  padding: EdgeInsets.fromLTRB(160, 0, 0, 30),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => forgotPass()));
                  }, // forgot password
                  textColor: Colors.grey,
                  child: Text('Forgot Password?'),
                ),*/

                Container(
                  height: 50,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    // ignore: sort_child_properties_last
                    child: const Text('Login', textAlign: TextAlign.center,),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.green,
                      textStyle: const TextStyle(color: Colors.white),
                      minimumSize: Size(200, 50),
                    ),
                    onPressed: () {
                      /*Navigator.push(context,
                          MaterialPageRoute(builder: (context) => homePage()));*/
                          signIn();
                    },
                  ),
                  
                ),
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
                            backgroundColor: Color.fromARGB(153, 143, 143, 143),
                            textStyle: const TextStyle(color: Colors.grey),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signupPage()));
                          },
                        ),
                        /*child: ElevatedButton(
                          padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.redAccent,
                          child: Text('Sign Up'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signupPage()));
                          },
                        ), */
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
