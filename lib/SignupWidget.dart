
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:test_app/insta_body.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/insta_list.dart';

import 'firebase.dart';
import 'home.dart';
import 'upload.dart';

var email;

class SignupWidget extends StatefulWidget {
  @override
  signup createState() => signup();
}

class signup extends State<SignupWidget>{
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();


  String? _email;
  String Bio="";
  String fullname="";
  String username="";
  String website="";
  String password="";
  String caption = "";

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
                SizedBox(
                  height: 200,
                  child: Image(
                      image: NetworkImage('https://assets.turbologo.com/blog/en/2019/09/19084953/instagram-logo-illustration-958x575.png')
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'email',
                      hintText: 'Enter Your email',
                    ),
                    onChanged: (value){
                      setState((){
                        _email = value.trim();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'full name',
                      hintText: 'full name',
                    ),
                    onChanged: (value){
                      setState((){
                        fullname = value.trim();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(

                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'username',
                      hintText: 'username',
                    ),
                    onChanged: (value){
                      setState((){
                        username = value.trim();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                    onChanged: (value){
                      setState((){
                        password = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  // Within the `FirstScreen` widget
                  onPressed: () async {
                    b[1]= username;
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('email', _email!);
                    email = _email!;
                    //email.toString();
                    try {
                      await Firebase.initializeApp();
                      UserCredential user =
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );

                      User? updateUser = FirebaseAuth.instance.currentUser;
                      updateUser!.updateProfile(displayName: _usernameController.text);
                      // userSetup(_fullnameController.text,_usernameController.text);

                      FirebaseFirestore.instance.collection('users')
                          .doc(email)
                          .set({
                        'username' : username,
                        'email' : email,
                        'password': password,
                        'fullname' : fullname,
                        'Bio': Bio,
                        'Website': ' ',
                        'caption': caption,
                      })
                          .then((value){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> home(fullname:fullname, username: username, Bio: Bio, email: email.toString(), caption:caption )));
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadWidget(email: email )));
                      });

                      Navigator.pushNamed(context, '/home');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  child: Text('Sign Up'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue[100]),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 150, vertical: 10),),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
                ),
                SizedBox(height: 15),

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
                        "                              Have an account?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        // Within the `FirstScreen` widget
                        onPressed: () {
                          // Navigate to the second screen using a named route.
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text('Login'),
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