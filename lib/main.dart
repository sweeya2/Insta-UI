import 'package:flutter/material.dart';
import 'package:test_app/insta_body.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'InstaUI',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => loginsignup(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => login(),
        '/signup': (context) => signup(),
        '/home': (context) => home(),
        '/profile': (context) => profile(),
        '/search': (context) => search(),
        '/dm': (context) => dm(),
        '/like': (context) => like(),
      },
    ),
  );
}

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

class login extends StatelessWidget {
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
                // Within the `FirstScreen` widget
                onPressed: () {
                  // Navigate to the second screen using a named route.
                  Navigator.pushNamed(context, '/home');
                },
                child: Text('Log in'),
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


class signup extends StatelessWidget {
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Password',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),

                SizedBox(height: 10),
                ElevatedButton(
                  // Within the `FirstScreen` widget
                  onPressed: () {
                    // Navigate to the second screen using a named route.
                    Navigator.pushNamed(context, '/home');
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
class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              onPressed: (){
              Navigator.pushNamed(context, '/dm');
              },
              )
            )
          ],
        ),
        body: new InstaBody(),
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
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
                  onPressed: () {},
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/like');
                  },
                ),
                // new IconButton(
                //   icon: Icon(
                //     Icons.account_box_outlined,
                //   ),
                //   onPressed: (){
                //     Navigator.pushNamed(context, '/profile');
                //   },
                // ),
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
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

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
              color: Colors.black
          ),
          backgroundColor: Colors.white,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Icon(
              Icons.lock,
                color: Colors.black
            ),
            Text(
                "apple",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
                color: Colors.black
            ),
          ]),
        ),
        body: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image(
                          height: 100,
                          image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/862px-Apple_logo_black.svg.png')
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "   54  \n posts",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "    1.1M   \n followers",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "       5    \n following",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ]
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "APPLE\nEveryone has a story to tell",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                // Within the `FirstScreen` widget
                onPressed: () {
                },
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 145, vertical: 10),),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Colors.black54)
                        )
                    )
                ),
              ),
              GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Image(
                      height: 100,
                      image: NetworkImage('https://i.pinimg.com/originals/73/44/ba/7344ba6cb9168b994cef0967142eacae.jpg'),
                      fit: BoxFit.fill,
                    ),
                    Image(
                      height: 100,
                      image: NetworkImage('https://images.unsplash.com/photo-1570591753973-56d194d3bd09?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3Vuc2V0JTIwdHVtYmxyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                      fit: BoxFit.fill,
                    ),
                    Image(
                      height: 100,
                      image: NetworkImage('https://i.pinimg.com/originals/0f/4c/28/0f4c28670d4679a7ca2ab1afec183cd7.jpg'),
                      fit: BoxFit.fill,
                    ),
                    Image(
                      height: 100,
                      image: NetworkImage('https://wallpaperaccess.com/full/3501969.png'),
                      fit: BoxFit.fill,
                    ),
                    Image(
                      height: 100,
                      image: NetworkImage('https://i.redd.it/6xbmtcb4k1n21.jpg'),
                      fit: BoxFit.fill,
                    ),
                    Image(
                      height: 100,
                      image: NetworkImage('https://wallpapercave.com/wp/wp4494775.jpg'),
                      fit: BoxFit.fill,
                    ),
                    Image(
                      height: 100,
                      image: NetworkImage('https://thumbs.dreamstime.com/b/blue-sky-pink-orange-clouds-aesthetic-tumblr-background-wallpaper-fairy-lights-172327487.jpg'),
                      fit: BoxFit.fill,
                    ),Image(
                      height: 100,
                      image: NetworkImage('https://i.pinimg.com/564x/15/c5/69/15c56972ae4fbb6b394a6e6efced477b.jpg'),
                      fit: BoxFit.fill,
                    ),
                    Image(
                      height: 100,
                      image: NetworkImage('https://media.istockphoto.com/photos/human-hand-holding-a-tumblr-lamp-picture-id1172668370?b=1&k=6&m=1172668370&s=170667a&w=0&h=NyH4tm-k6j2P_VbQdfTI8MM66QAgyMmpuAlqz5Olm6o='),
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ElevatedButton(
                // Within the `FirstScreen` widget
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  'Log out',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 150, vertical: 10),),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Colors.blue)
                        )
                    )
                ),
              ),
            ],
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
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
                  onPressed: () {},
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/like');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.account_box,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}
class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xfff8faf8),
          centerTitle: true,
          elevation: 1.0,
          title:Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height: 40,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),

                  labelText: 'Search',
                  hintText: 'Search',
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Icon(
                        Icons.document_scanner_outlined,
                        color: Colors.black
                    ),
                  ]),
            ),

          ],
          leading: BackButton(
              color: Colors.black
          ),
        ),
        body: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
               SizedBox(
                  height: 50, child: Image.asset("assets/a.jpeg")
              ),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children: <Widget>[
                  Image(
                    height: 100,
                    image: NetworkImage('https://i.pinimg.com/originals/73/44/ba/7344ba6cb9168b994cef0967142eacae.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://images.unsplash.com/photo-1570591753973-56d194d3bd09?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3Vuc2V0JTIwdHVtYmxyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://i.pinimg.com/originals/0f/4c/28/0f4c28670d4679a7ca2ab1afec183cd7.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://wallpaperaccess.com/full/3501969.png'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://i.redd.it/6xbmtcb4k1n21.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://wallpapercave.com/wp/wp4494775.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://thumbs.dreamstime.com/b/blue-sky-pink-orange-clouds-aesthetic-tumblr-background-wallpaper-fairy-lights-172327487.jpg'),
                    fit: BoxFit.fill,
                  ),Image(
                    height: 100,
                    image: NetworkImage('https://i.pinimg.com/564x/15/c5/69/15c56972ae4fbb6b394a6e6efced477b.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://media.istockphoto.com/photos/human-hand-holding-a-tumblr-lamp-picture-id1172668370?b=1&k=6&m=1172668370&s=170667a&w=0&h=NyH4tm-k6j2P_VbQdfTI8MM66QAgyMmpuAlqz5Olm6o='),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://wallpaperaccess.com/full/1235903.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('http://images6.fanpop.com/image/photos/40900000/tumblr-wallpapers-ari-and-rachel-E2-99-A5-40971333-1000-1900.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://image.winudf.com/v2/image1/Y29tLnRodW5rYWJsZS5hbmRyb2lkLmNhaW9fY2FybG9zcm95YWxlMS53YWxscGFwZXJfc2NyZWVuXzFfMTU2NzE1NDQzMV8wMjM/screen-1.jpg?fakeurl=1&type=.jpg'),
                    fit: BoxFit.fill,
                  ),
                  Image(
                    height: 100,
                    image: NetworkImage('https://wallpaperboat.com/wp-content/uploads/2019/07/tumblr-girl-02.jpg'),
                    fit: BoxFit.fill,
                  ),Image(
                    height: 100,
                    image: NetworkImage('https://images.pexels.com/photos/3685271/pexels-photo-3685271.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    fit: BoxFit.fill,
                  ),Image(
                    height: 100,
                    image: NetworkImage('http://images5.fanpop.com/image/photos/29000000/Tumblr-photography-3-tumblr-photography-29018579-500-667.jpg'),
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ],
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                  ),
                  onPressed: () {},
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/like');
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.account_box_outlined,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}
class dm extends StatelessWidget {
  static final List a = [
    "https://media-exp3.licdn.com/dms/image/C5603AQEhv8cuonw6Dw/profile-displayphoto-shrink_800_800/0/1620213159399?e=1631750400&v=beta&t=SewM8LVQ6rDOestLJqqF-ASaurUNSuwnQ9gf27PCSfg",
    "https://media-exp3.licdn.com/dms/image/C4E03AQHc6vYFW6MJWw/profile-displayphoto-shrink_800_800/0/1612886682134?e=1631750400&v=beta&t=H8-WiVDeEF9MofBbyO_ywS0tFm97bon0mw23IsLK5zo",
    "https://media-exp3.licdn.com/dms/image/C4D03AQHGU4G2-8ABCw/profile-displayphoto-shrink_800_800/0/1623914344169?e=1631750400&v=beta&t=DZ2nXtj2KhosdOt2gSnaFPHuYxY_t_r3gdU57t8F8BI",
    "https://media-exp3.licdn.com/dms/image/C4E03AQFTfnOYxzdQkg/profile-displayphoto-shrink_800_800/0/1611146821633?e=1631750400&v=beta&t=ltnAHify20CDRbMsbOprwLW-oEJ5SKjYAX6NcP1g47c",
    "https://media-exp3.licdn.com/dms/image/C5603AQFnbUNqPCHUyw/profile-displayphoto-shrink_800_800/0/1609847226661?e=1631750400&v=beta&t=iBTQjv2sS9MBEAf9WvQTjxmpNZu38vtr0I0MBeTzO84",
    "https://cdn.pixabay.com/photo/2016/02/13/12/26/aurora-1197753_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/08/05/26/woman-1807533_960_720.jpg",
    "https://i.pinimg.com/originals/56/6a/12/566a12e631c854dd017210ee7acf87b6.jpg",
    "https://c4.wallpaperflare.com/wallpaper/108/140/869/digital-digital-art-artwork-fantasy-art-drawing-hd-wallpaper-preview.jpg",
    "https://i.pinimg.com/originals/56/6a/12/566a12e631c854dd017210ee7acf87b6.jpg"
  ];
  static final List b =["aadarsh", "misshappy", "swee", "tan", "sid","vatsal", "ripu", "archit", "himanshu", "manan"];
  static final List c =[
    "sleeping\n.1h",
    "cutie\n.2h",
    "duh?\n.3h",
    "hii!\n.4h",
    "scribble\n.5h",
    "gn :)\n.6h",
    "sweee\n.7h",
    "bro\n.8h",
    "helloo\n.9h",
    "vibing!\n.1h"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
              color: Colors.black
          ),
          backgroundColor: Colors.white,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "apple",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black
                ),
              ]),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Icon(
                        Icons.add,
                        color: Colors.black
                    ),
                  ]),
            ),
          ],
        ),
        body: new SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50.0,
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(),
                                labelText: 'Search',
                                hintText: 'Search',
                              ),
                            ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (BuildContext context,int index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                            leading: new Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(a[index])),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            trailing: Icon(Icons.camera_alt_outlined),
                            title:Text(
                                "${b[index]} \n${c[index]}"
                            )
                        ),
                      );
                    }
                ),
              ],
            ),
        ),
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 80.0,
          alignment: Alignment.center,
          child: new BottomAppBar(
            child: new Row(
              // alignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.lightBlueAccent,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                new Text(
                  'Camera',
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
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
                  onPressed: () {},
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}