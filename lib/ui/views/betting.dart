import 'package:betejee/core/modal/todaymatches/matchesList.dart';
import 'package:betejee/ui/forms/bettingform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Betting extends StatefulWidget {
  static const route = '/betting';

  @override
  _BettingState createState() => _BettingState();
}

class _BettingState extends State<Betting> {
 
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<MatchesList>(context)
        .items
        .firstWhere((items) => items.id == id);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blueGrey[900],
          // child: ListView(
          //   children: [
              // Container(
              //     margin: EdgeInsets.only(
              //         left: height / 60,
              //         top: height / 140,
              //         bottom: height / 30),
              //     child: Text(
              //       "Bet And win ",
              //       style: TextStyle(
              //           color: Colors.white54,
              //           fontSize: height / 40,
              //           fontWeight: FontWeight.bold),
              //     )),
              // Container(
              //   margin: EdgeInsets.only(left: 40, right: 20),
              //   child: Row(
              //     children: [
              //       Expanded(
              //           child: Row(children: [
              //         Image(
              //             height: height / 13,
              //             image: NetworkImage(product.firstimageUrl)),
              //         Container(
              //           margin: EdgeInsets.only(
              //             left: height / 60,
              //           ),
              //           child: Text(
              //             product.firstname,
              //             style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: height / 50,
              //                 fontWeight: FontWeight.w500),
              //           ),
              //         ),
              //       ])),
              //       Container(
              //         margin: EdgeInsets.only(
              //           right: height / 30,
              //         ),
              //         child: Text(
              //           "VS",
              //           style: TextStyle(
              //               color: Colors.red,
              //               fontSize: height / 60,
              //               fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //       Expanded(
              //         child: Row(children: [
              //           Image(
              //               height: height / 13,
              //               image: NetworkImage(product.secondImageUrl)),
              //           Container(
              //             margin: EdgeInsets.only(
              //               left: height / 60,
              //             ),
              //             child: Text(
              //               product.secondname,
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontSize: height / 50,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ),
              //         ]),
              //       )
              //     ],
              //   ),
              // ),
            child: BettingForms(id:product.id)
            //],
          ),
        ),
     // ),
    );
  }
}
