import 'package:betejee/ui/widget/home_screen/clickCircle.dart';
import 'package:betejee/ui/widget/home_screen/productlikeimage.dart';
import 'package:betejee/ui/widget/home_screen/simpleCircle.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SecondImage extends StatefulWidget {
  @override
  _SecondImageState createState() => _SecondImageState();
}

int imagelikeindex = 0;

CarouselSlider carouselSlider;

class _SecondImageState extends State<SecondImage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Container(
        width: double.infinity,
        child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  imagelikeindex = index;
                });
              },
              viewportFraction: 1,
              height: height / 5,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
            ),
            items: ProductLikeImages().productlikeimages),
      ),
      Positioned(
        left: height / 55,
        top: height / 60,
        child: Text("More to come",
            style: TextStyle(
                color: Colors.white,
                fontSize: height / 40,
                fontWeight: FontWeight.bold)),
      ),
      Positioned(
        left: height / 55,
        top: height / 20,
        child: Text("Stay tune",
            style: TextStyle(
                color: Colors.white,
                fontSize: height / 40,
                fontWeight: FontWeight.bold)),
      ),
      Positioned(
        left: height / 55,
        top: height / 6,
        child: Text("We give you best betting experience",
            style: TextStyle(color: Colors.white, fontSize: height / 60)),
      ),
      Positioned(
        top: height / 6.5,
        left: height / 2.9,
        child: Row(
          children: [1, 2, 3, 4].map<Widget>((url) {
            int index = [1, 2, 3, 4].indexOf(url);
            return Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                child:
                    imagelikeindex == index ? ClickCircle() : SimpleCirsle());
          }).toList(),
        ),
      ),
    ]);
  }
}
