import 'package:betejee/core/modal/Provider/addbetting.dart';
import 'package:flutter/material.dart';
import "dart:math";
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Unverifiesd extends StatefulWidget {
  @override
  _UnverifiesdState createState() => _UnverifiesdState();
}

class _UnverifiesdState extends State<Unverifiesd> {
  @override
  void initState() {
    Provider.of<AddBetting>(context, listen: false)
        .fetchdata()
        .catchError((e) => print(e));

    super.initState();
  }

  String _launchUrl = "https://esewa.com.np/#/home";

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: true,
          forceWebView: false,
          headers: <String, String>{'header_key': 'header_value'});
    } else {
      throw ("couldnot launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<AddBetting>(context, listen: true).items;
    print(items.length);
    final unverify = items.where((element) => element.verify == false).toList();
    print(unverify.length);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Unverify"),
        ),
        body: Container(
          height: double.infinity,
          color: Colors.black,
          child: unverify.length == 0
              ? Center(
                  child: Text(
                  "No unverified members fill the betting form",
                  style: TextStyle(color: Colors.white),
                ))
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: unverify.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext ctx, index) {
                    getRandomElement<T>(List<T> list) {
                      final random = new Random();
                      var i = random.nextInt(list.length);
                      return list[i];
                    }

                    var list = [
                      'images/cat.jpg',
                      'images/dog.jpg',
                      'images/tom and jery.jpg',
                    ];
                    var element = getRandomElement(list);
                    return Container(
                      // alignment: Alignment.center,
                      // child: Text(element),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            child: Image(
                              image: AssetImage(element),
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            unverify[index].name,
                            style: TextStyle(color: Colors.white70),
                          ),
                          Text(
                            unverify[index].firstcounty +
                                "(" +
                                unverify[index].firstprednum.toString() +
                                ") - " +
                                unverify[index].secondcountry +
                                "(" +
                                unverify[index].secondprednum.toString() +
                                ")",
                            style: TextStyle(color: Colors.white70),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                _launchInBrowser(_launchUrl);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30.0,
                                      right: 30.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  child: Text(
                                    "Pay",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: height / 60,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
        ));
  }
}
