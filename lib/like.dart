import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:test_app/profile.dart';
//import 'LoginWidget.dart';
import 'home.dart';
import 'upload.dart';

import 'insta_list.dart';

class like extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
              color: Colors.black
          ),
          backgroundColor: Colors.white,

        ),
        body: new SingleChildScrollView(
          child: Center(
            child: Image(
              image: AssetImage('assets/b.jpeg'),
            ),
          ),
        ),
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 80.0,
          alignment: Alignment.center,
          child: new BottomAppBar(
            child: new Row(
              // alignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  onPressed: () async {
                    //url = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
                    e[1] = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
 //                   Navigator.pushNamed(context, '/home');
                    CollectionReference users = FirebaseFirestore.instance.collection('users');
                    DocumentSnapshot ds= await users.doc (email).get();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> home(fullname:ds.get('fullname'),  username: ds.get('username'), caption: ds.get('caption'),Bio: ds.get('Bio'),email: ds.get('email'))));
                    //Navigator.pushNamed(context, '/upload');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.search_outlined,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/upload');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/like');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.account_box_outlined,
                  ),
                  onPressed: () async {
                    url = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
                    CollectionReference users = FirebaseFirestore.instance.collection('users');
                    DocumentSnapshot ds= await users.doc (email).get();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> profile(fullname:ds.get('fullname'),email:ds.get('email'),Website:ds.get('Website'),  username: ds.get('username'), Bio: ds.get('Bio'))));
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}