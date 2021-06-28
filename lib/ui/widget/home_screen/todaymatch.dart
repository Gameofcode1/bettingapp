import 'package:flutter/material.dart';
class TodayMatch extends StatelessWidget {
  final String id;
  final String firstimageUrl;
  final String secondImageUrl;
  final String firstname;
  final String secondname;
  final String datetime;
  TodayMatch({this.datetime,this.firstimageUrl,this.firstname,this.id,this.secondImageUrl,this.secondname});
  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(
            left: height / 60,          
            bottom: height / 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 1.0, color: Colors.white38)),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8.0, top: 25.0, bottom: 20.0, right: 8.0),
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(
                left: height / 30,
              ),
              child: Row(children: [
                Expanded(
                    child: Row(children: [
                  Image(
                      height: height / 20,
                      width: width/10,
                      image: NetworkImage(
                         firstimageUrl)),
                  Container(
                    margin: EdgeInsets.only(
                      left: height / 60,
                    ),
                    child: Text(
                      firstname,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height / 60,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ])),
                Container(
                  margin: EdgeInsets.only(
                    right: height / 30,
                  ),
                  child: Text(
                    "VS",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: height / 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Row(children: [
                    Image(
                        height: height / 20,
                         width: width/10,
                        image: NetworkImage(
                            secondImageUrl)),
                    Container(
                      margin: EdgeInsets.only(
                        left: height / 60,
                      ),
                      child: Text(
                        secondname,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: height / 60,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ]),
            ),
            Center(
              child: Text(
               datetime,
                style: TextStyle(
                    color: Colors.white38,
                    fontSize: height / 60,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ]),
        ));
  }
}
