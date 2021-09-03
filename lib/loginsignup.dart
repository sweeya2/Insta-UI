
import 'package:flutter/material.dart';

class loginsignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: new SingleChildScrollView(
        child: Column(
            children: <Widget>[
              SizedBox(height: 100),
              Image(
                  image: NetworkImage('https://assets.turbologo.com/blog/en/2019/09/19084953/instagram-logo-illustration-958x575.png')
              ),
              SizedBox(height: 50),
              ElevatedButton(
                // Within the `FirstScreen` widget
                onPressed: () {
                  // Navigate to the second screen using a named route.
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Log in'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 150, vertical: 15),),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                // Within the `FirstScreen` widget
                onPressed: () {
                  // Navigate to the second screen using a named route.
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 145, vertical: 15),),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Colors.blue)
                        )
                    )
                ),
              ),
            ]

        ),
      ),
    );
  }
}