
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:test_app/dm.dart';
import 'package:test_app/profile.dart';
import 'package:test_app/search.dart';
import 'package:test_app/upload.dart';

//import 'LoginWidget.dart';

import 'insta_body.dart';
import 'insta_list.dart';


var email;

class home extends StatefulWidget{
  home({Key? key, required this.fullname, required this.username,required this.caption, required this.Bio, required this.email}):super(key:key);
  String username='';
  String fullname = '';
  String Bio= '';
  String email='';
  String caption='';

  @override
  HomeState createState()=> HomeState();
}

class HomeState extends State<home> {
  @override



  Widget build(BuildContext context) {
    //print(URLL);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xfff8faf8),
          centerTitle: true,
          elevation: 1.0,
          leading: new Icon(
              Icons.camera_alt,
              color: Colors.black
          ),
          title: SizedBox(
              height: 120, child: Image.network("https://assets.turbologo.com/blog/en/2019/09/19084953/instagram-logo-illustration-958x575.png")
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                icon: Icon(Icons.live_tv),
                color: Colors.black,
                onPressed: (){
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.black,
                  onPressed: () async {
                    CollectionReference users = FirebaseFirestore.instance.collection('users');
                    DocumentSnapshot ds= await users.doc (widget.email).get();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> dm(username: ds.get('username'))));
                  },
                )
            )
          ],
        ),
        body: new InstaBody(),
        /*
        bottomNavigationBar: BottomNavigationBar(
          onTap: (val){

    },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home)),
    BottomNavigationBarItem(icon: Icon(Icons.search)),
    BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined)),
    BottomNavigationBarItem(icon: Icon(Icons.home)),
    BottomNavigationBarItem(icon: Icon(Icons.home)),
    ],
    ),

         */

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
                    Icons.home,
                  ),
                  onPressed: () async {
                    //url = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
                    //e[1] = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
                    email = widget.email;
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.search_outlined,
                  ),
                  onPressed: () {
                    email = widget.email;
                      Navigator.pushNamed(context, '/search');
  //                  Navigator.push(context, MaterialPageRoute(builder: (context)=> search(email: widget.email )));

                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                  ),
                  onPressed: () async {
                    email = widget.email;
                    CollectionReference users = FirebaseFirestore.instance.collection('users');
                    DocumentSnapshot ds= await users.doc (widget.email).get();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadWidget(email:ds.get('email'), username:ds.get('username'), caption:ds.get('caption') )));
                    //Navigator.pushNamed(context, '/upload');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  onPressed: () {
                    email = widget.email;
                    Navigator.pushNamed(context, '/like');
                  },
                ),

                ClipOval(
                  child:FlatButton(
                    child: new Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage("https://e7.pngegg.com/pngimages/757/1018/png-clipart-apple-logo-apple-desktop-models-logo-computer-wallpaper.png")),
                        border: Border.all(
                          color: Colors.deepOrange,
                          width: 1,
                        ),
                      ),

                    ),
                    onPressed: () async {
                      email = widget.email;
                      url = await FirebaseStorage.instance.ref('folderName/imageName').getDownloadURL();
                      CollectionReference users = FirebaseFirestore.instance.collection('users');
                      DocumentSnapshot ds= await users.doc (widget.email).get();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> profile(fullname:ds.get('fullname'),email:ds.get('email'),Website:ds.get('Website'),  username: ds.get('username'), Bio: ds.get('Bio'))));
                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
