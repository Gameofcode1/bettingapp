import 'package:betejee/core/modal/Provider/addbetting.dart';
import 'package:betejee/core/modal/todaymatches/matches.dart';
import 'package:betejee/core/modal/todaymatches/matchesList.dart';
import 'package:betejee/ui/views/unverified.dart';
import 'package:betejee/ui/views/verified.dart';
import 'package:betejee/ui/widget/home_screen/firstImagechange.dart';
import 'package:betejee/ui/widget/home_screen/home_screen.dart';
import 'package:betejee/ui/widget/home_screen/oldmatches.dart';
import 'package:betejee/ui/widget/home_screen/todaymatches.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final items = Provider.of<MatchesList>(context).items;
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.black,
            content: Text("Are you sure you want to close application?",
                style: TextStyle(color: Colors.white)),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("Yes",
                      style: TextStyle(fontSize: 15, color: Colors.red))),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("No",
                      style: TextStyle(fontSize: 15, color: Colors.teal)))
            ],
          ),
        );
      },
      child: Scaffold(
        drawer: SafeArea(
          child: SizedBox(
            width: width / 1.6,
            child: new Drawer(
                child: new Container(
                    color: Colors.black,
                    child: ListView(
                      children: [
                        Image(
                          image: AssetImage("images/sports.jpg"),
                        ),
                         ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                            },
                            leading: Icon(
                              Icons.home,
                              color: Colors.red,
                            ),
                            title: Text("Home",
                                style: TextStyle(color: Colors.white))),
                        ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Unverifiesd()),
                              );
                            },
                            leading: Icon(
                              Icons.shopping_cart,
                              color: Colors.red,
                            ),
                            title: Text("Unverified Bets",
                                style: TextStyle(color: Colors.white))),
                        ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Verified()),
                              );
                            },
                            leading: Icon(
                              Icons.verified,
                              color: Colors.red,
                            ),
                            title: Text("Verified Bets",
                                style: TextStyle(color: Colors.white))),

                        ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.red,
                            ),
                            title: Text("Profile",
                                style: TextStyle(color: Colors.white)))
                      ],
                    ))),
          ),
        ),
        body: SafeArea(
          child: HomePage(height: height, items: items),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    @required this.height,
    @required this.items,
  }) : super(key: key);

  final double height;
  final List<TodayMatche> items;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: ListView(
          children: [
            ImageChanger(),
            Container(
                margin: EdgeInsets.only(
                    left: height / 60, top: height / 40, bottom: height / 30),
                child: Text(
                  "Bet And win for sure",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: height / 35,
                      fontWeight: FontWeight.bold),
                )),
            SecondImage(),
            Container(
                margin: EdgeInsets.only(
                    left: height / 60, top: height / 30, bottom: height / 30),
                child: Text(
                  "Today Matches",
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: height / 45,
                      fontWeight: FontWeight.bold),
                )),
            TodayMatches(),
            // Container(
            //     margin: EdgeInsets.only(
            //         left: height / 60, top: height / 140, bottom: height / 30),
            //     child: Text(
            //       "Teams",
            //       style: TextStyle(
            //           color: Colors.white54,
            //           fontSize: height / 45,
            //           fontWeight: FontWeight.bold),
            //     )),
            // Container(
            //   height: height / 7,
            //   child: ListView.builder(
            //     physics: ScrollPhysics(),
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     itemCount: TopList().items.length,
            //     itemBuilder: (context, int index) {
            //       return TopTeam(images: TopList().items[index].images);
            //     },
            //   ),
            // ),
            Container(
                margin: EdgeInsets.only(
                    left: height / 60, top: height / 140, bottom: height / 30),
                child: Text(
                  "Matches history",
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: height / 45,
                      fontWeight: FontWeight.bold),
                )),
            Oldmatches()
          ],
        ));
  }
}

