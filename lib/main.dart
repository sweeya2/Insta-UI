import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/loginsignup.dart';
import 'package:test_app/LoginWidget.dart';
import 'package:test_app/SignupWidget.dart';
import 'package:test_app/home.dart';
import 'package:test_app/profile.dart';
import 'package:test_app/search.dart';
import 'dm.dart';
import 'like.dart';
import 'package:test_app/upload.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:permission_handler/permission_handler.dart';

var email;

Future<void> main() async {
  String username='';
  String fullname = '';
  String Bio= '';
  String caption= '';
  String Website= '';
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email');

  runApp(
    MaterialApp(
      title: 'InstaUI',
      debugShowCheckedModeBanner: false,
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: email == null ? '/' : '/home',
      routes: {
        '/': (context) => loginsignup(),
        '/login': (context) => LoginWidget(),
        '/signup': (context) => SignupWidget(),
        '/home': (context) => home(fullname:fullname,caption:caption, username: username, Bio : Bio, email:email),
        '/profile': (context) => profile(fullname:fullname,Website:Website, email:email, username: username, Bio: Bio),
        '/search': (context) => search(),
        '/dm': (context) => dm( username: username),
        '/like': (context) => like(),
        '/upload': (context) => UploadWidget(email: email, username: username,caption:caption),
      },
    ),
  );
}