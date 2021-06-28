import 'package:betejee/core/modal/gameimagelist.dart';
import 'package:betejee/ui/widget/home_screen/clickCircle.dart';
import 'package:betejee/ui/widget/home_screen/simpleCircle.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageChanger extends StatefulWidget {

  @override
  _ImageChangerState createState() => _ImageChangerState();
}

class _ImageChangerState extends State<ImageChanger> {
  int currentindex = 0;

  CarouselSlider carouselSlider;
  @override
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
                  currentindex = index;
                });
              },
              viewportFraction: 1,
              height: height / 3,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
            ),
            items: GamesImages().gamesimages),
      ),
      IconButton(
        icon: Icon(
          Icons.menu,
          size: height / 35,
          color: Colors.white,
        ),
        onPressed: (){
          Scaffold.of(context).openDrawer();
        },
        // onPressed: () {
        //  Scaffold.of(context).openDrawer();
        // },
      ),

      // Positioned(
      //     left: height / 2.57,
      //     top: height / 200,
      //     child: CircleAvatar(
      //       radius: height / 120,
      //       backgroundColor: Colors.red,
      //       child: Text(data.length.toString(),style: TextStyle(fontSize: height/90),),
      //     )),

      Positioned(
        left: height / 2.5,
        child: IconButton(
          icon: Icon(
            Icons.notifications,
            size: height / 35,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.pushNamed(context, AddProduct.routename);
          },
        ),
      ),
      Positioned(
        top: height / 3.7,
        left: height / 2.9,
        child: Row(
          children: [1, 2, 3, 4, 5].map<Widget>((url) {
            int index = [1, 2, 3, 4, 5].indexOf(url);
            return Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                child: currentindex == index ? ClickCircle() : SimpleCirsle());
          }).toList(),
        ),
      ),
    ]);
  }
}
