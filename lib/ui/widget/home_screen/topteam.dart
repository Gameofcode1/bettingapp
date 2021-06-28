import 'package:flutter/material.dart';

class TopTeam extends StatelessWidget {
  final String images;
  TopTeam({this.images});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
        margin: EdgeInsets.only(
            left: height / 60, top: height / 140, bottom: height / 30),
        child: Image(
          height: height / 10,
          image: AssetImage(images),
        ));
  }
}
