import 'package:betejee/core/modal/todaymatches/matchesList.dart';
import 'package:betejee/ui/views/betting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewBottomSheet extends StatelessWidget {
  final String id;
  NewBottomSheet({this.id});
  static const nameroute = "/bottomsheet";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //  final String id = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<MatchesList>(context)
        .items
        .firstWhere((items) => items.id == id);

    return Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        height: MediaQuery.of(context).size.height / 3,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: height / 80,
                    ),
                    child: Text(
                      "Bet And Win",
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: height / 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(children: [
                        Image(
                            height: height / 20,
                            width: width/10,
                            image: NetworkImage(product.firstimageUrl)),
                        Container(
                          margin: EdgeInsets.only(
                            left: height / 60,
                          ),
                          child: Text(
                            product.firstname,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: height / 60,
                                fontWeight: FontWeight.w500),
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
                              image: NetworkImage(product.secondImageUrl)),
                          Container(
                            margin: EdgeInsets.only(
                              left: height / 60,
                            ),
                            child: Text(
                              product.secondname,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: height / 60,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    child: Text(
                      "Time:" + product.datetime,
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: height / 60,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap:(){
                       Navigator.pop(context);
                    Navigator.pushNamed(context, Betting.route,arguments: product.id);
                   
                    } ,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
                        child: Text(
                          "Bet",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height / 60,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox()
              ]),
        ));
  }
}
