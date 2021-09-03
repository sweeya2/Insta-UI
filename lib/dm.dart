


import 'package:flutter/material.dart';

class dm extends StatefulWidget{
  String username='';
  dm({Key? key, required this.username}):super(key:key);

  @override
  DmState createState()=> DmState();
}

class DmState extends State<dm> {
  static final List a = [
    "https://media-exp3.licdn.com/dms/image/C5603AQEhv8cuonw6Dw/profile-displayphoto-shrink_800_800/0/1620213159399?e=1631750400&v=beta&t=SewM8LVQ6rDOestLJqqF-ASaurUNSuwnQ9gf27PCSfg",
    "https://media-exp3.licdn.com/dms/image/C4E03AQHc6vYFW6MJWw/profile-displayphoto-shrink_800_800/0/1612886682134?e=1631750400&v=beta&t=H8-WiVDeEF9MofBbyO_ywS0tFm97bon0mw23IsLK5zo",
    "https://media-exp1.licdn.com/dms/image/C4D03AQEsAY1Ga-BtIw/profile-displayphoto-shrink_800_800/0/1627030531284?e=1632960000&v=beta&t=nebVX8Hct0DI3iYHskXuNmOLRoNCHhjuFZ5-kzpYrrQ",
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
                  widget.username,
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