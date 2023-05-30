import 'package:digihydro/mainpages/dashboard.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:digihydro/login/signup_screen.dart';
import 'package:digihydro/login/forgot_pass1.dart';
import 'package:firebase_auth/firebase_auth.dart';

class IndexScreen extends StatefulWidget {
  @override
  index createState() => index();
}

Color errorColor(DataSnapshot snapshot) {
  return Colors.red;
}

class index extends State<IndexScreen> {
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
                        minimumSize: Size(120, 50),
                      ),
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          signIn();
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 40, 50, 0),
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
