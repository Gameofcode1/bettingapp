import 'package:flutter/material.dart';

class ProductLikeSlider extends StatelessWidget {
  final String imagemane;
  ProductLikeSlider({this.imagemane});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      child: Image(
        image: AssetImage(imagemane),
        fit: BoxFit.cover,
        width: double.infinity,
        height: height / 4.5,
      ),
    );
  }
}