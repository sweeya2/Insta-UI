import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_app/home.dart';
import 'package:test_app/insta_body.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/home.dart';

import 'insta_list.dart';

var email;

class LoginWidget extends StatefulWidget {
  @override
  login createState() => login();
}

class login extends State<LoginWidget> {
  String? _email, _password;
  String username='';
  String fullname = '';
  String caption = '';
  String Bio= '';
  //String? _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            ' ',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),

          ),
          leading: BackButton(
              color: Colors.black
          ),
          backgroundColor: Colors.white,
        ),
        body: new SingleChildScrollView(
          child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                SizedBox(
                  height: 200,
                  child: Image(
                      image: NetworkImage('https://assets.turbologo.com/blog/en/2019/09/19084953/instagram-logo-illustration-958x575.png')
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter Your Name',
                    ),
                    onChanged: (value){
                      setState((){
                        _email = value.trim();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                    onChanged: (value){
                      setState((){
                        _password = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '                                                      Forgot Password',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {

                    // Navigate to the second screen using a named route.
                    auth.signInWithEmailAndPassword(email: _email!, password: _password!)
                        .then((value) async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('email', _email!);
                      email = _email!;
                      CollectionReference users = FirebaseFirestore.instance.collection('users');
                      DocumentSnapshot ds= await users.doc (email).get();
                      b[1]= ds.get('username');
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => home(fullname:ds.get('fullname'),  username: ds.get('username'), caption: ds.get('caption'),Bio: ds.get('Bio'),email: ds.get('email')),
                        ),
                      );
                    })
                        .catchError((err){
                      print(err);
                    });


                  },
                  child: Text('Log in'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue[100]),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 150, vertical: 10),),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
                ),
                SizedBox(height: 15),
                SignInButton(
                  Buttons.Google,
                  onPressed: () async{

                    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
                    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
                    final credential = GoogleAuthProvider.credential(
                      accessToken: googleAuth.accessToken,
                      idToken: googleAuth.idToken,
                    );
                    await FirebaseAuth.instance.signInWithCredential(credential)
                        .then((value) async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('email', googleUser.email);
                      email = googleUser.email;
                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => home(fullname:fullname,caption:caption,username: username, Bio : Bio, email:email),
                        ),
                      );
                    })
                        .catchError((err) {
                      print(err);
                    });
                  },
                ),
                Text(
                  '--------------------OR--------------------',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                Row(
                    children: <Widget>[
                      Text(
                        "                     Don't have an account?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        // Within the `FirstScreen` widget
                        onPressed: () {
                          // Navigate to the second screen using a named route.
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text('Sign Up'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white24),
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10, vertical: 10),),
                            textStyle: MaterialStateProperty.all(TextStyle(fontSize:  15))),
                      ),
                    ]
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Instagram by Facebook",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }
}