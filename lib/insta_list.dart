import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/insta_stories.dart';
import 'package:test_app/profile.dart';

import 'home.dart';

class InstaList extends StatefulWidget {

  @override
  _InstaListState createState() => _InstaListState();
}
String instalistusername="";
 List e = ["", "https://www.enjpg.com/img/2020/aesthetic-pictures-7.jpg",
  "http://images6.fanpop.com/image/photos/40900000/YourName-kimi-no-na-wa-40955557-1400-700.jpg",
  "https://theawesomeone.com/wp-content/uploads/2020/12/kiminonawa-scaled.jpg",
  "https://filmdaze.net/wp-content/uploads/2018/06/vlcsnap-2018-06-13-16h56m12s456.png",
  "https://cdn.theatlantic.com/thumbor/wwN1-QWO5L7VGpSouvrSMBw1y3I=/79x44:1843x1036/1600x900/media/img/mt/2017/04/your_name-1/original.jpg"
];
List b =["","${instalistusername}", "misshappy", "swee", "tan", "sid"];
List c =["","Mumbai,India", "Pune,India", "Hyderabad,India", "Delhi,India", "Punjab,India"];
List d =["","https://media-exp3.licdn.com/dms/image/C5603AQEhv8cuonw6Dw/profile-displayphoto-shrink_800_800/0/1620213159399?e=1631750400&v=beta&t=SewM8LVQ6rDOestLJqqF-ASaurUNSuwnQ9gf27PCSfg",
  "https://media-exp3.licdn.com/dms/image/C4E03AQHc6vYFW6MJWw/profile-displayphoto-shrink_800_800/0/1612886682134?e=1631750400&v=beta&t=H8-WiVDeEF9MofBbyO_ywS0tFm97bon0mw23IsLK5zo",
  "https://media-exp1.licdn.com/dms/image/C4D03AQEsAY1Ga-BtIw/profile-displayphoto-shrink_800_800/0/1627030531284?e=1632960000&v=beta&t=nebVX8Hct0DI3iYHskXuNmOLRoNCHhjuFZ5-kzpYrrQ",
  "https://media-exp3.licdn.com/dms/image/C4E03AQFTfnOYxzdQkg/profile-displayphoto-shrink_800_800/0/1611146821633?e=1631750400&v=beta&t=ltnAHify20CDRbMsbOprwLW-oEJ5SKjYAX6NcP1g47c",
  "https://media-exp3.licdn.com/dms/image/C5603AQFnbUNqPCHUyw/profile-displayphoto-shrink_800_800/0/1609847226661?e=1631750400&v=beta&t=iBTQjv2sS9MBEAf9WvQTjxmpNZu38vtr0I0MBeTzO84"];
class _InstaListState extends State<InstaList> {
  bool isPressed = false;
  @override
  // void initState() {
  //   print(URLL);
  //   super.initState();
  // }
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: b.length,
      itemBuilder: (context, index) => index == 0
          ? new SizedBox(
        child: new InstaStories(),
        height: deviceSize.height * 0.2,
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                d[index])),
                      ),
                    ),
                    new SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text(
                          b[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        new Text(
                          c[index],
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                new IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: null,
                )
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: new Image.network(
              //URLL,
              e[index],
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(isPressed
                          ? Icons.favorite
                          : FontAwesomeIcons.heart),
                      color: isPressed ? Colors.red : Colors.black,
                      onPressed: () {
                        if(!isPressed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                duration: const Duration(seconds: 1),
                                content: const Text('You have liked the post')
                            ),
                          );
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                duration: const Duration(seconds: 1),
                                content: const Text('You have unliked the post')
                            ),
                          );
                        }
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                    ),
                    new SizedBox(
                      width: 16.0,
                    ),
                    new Icon(
                      FontAwesomeIcons.comment,
                    ),
                    new SizedBox(
                      width: 16.0,
                    ),
                    new Icon(FontAwesomeIcons.paperPlane),
                  ],
                ),
                new Icon(FontAwesomeIcons.bookmark)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Liked by misshappy, swee and 528,331 others\nYOUR NAME....In the dreams U&I were switching places",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://e7.pngegg.com/pngimages/757/1018/png-clipart-apple-logo-apple-desktop-models-logo-computer-wallpaper.png")),
                  ),
                ),
                new SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: new TextField(
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add a comment...",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
            Text("1 Day Ago", style: TextStyle(color: Colors.grey)),
          )
        ],
      ),
    );
  }
}