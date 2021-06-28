import 'package:flutter/material.dart';

class GameImageSlider extends StatelessWidget {
  final String imagemane;

  GameImageSlider({this.imagemane});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        children: [
          Image(
            image: AssetImage(imagemane),
            fit: BoxFit.cover,
            width: double.infinity,
            height: height / 3,
          ),
        ],
      ),
    );
  }
}