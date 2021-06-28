import 'package:flutter/material.dart';


class ClickCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/18,
      height: MediaQuery.of(context).size.height/39,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white30, width: MediaQuery.of(context).size.height/800),
          borderRadius: BorderRadius.circular(20.0),
          ),
      child: Padding(
        padding:  EdgeInsets.all( MediaQuery.of(context).size.height/200),
        child: CircleAvatar(
          backgroundColor: Colors.black87
         
        ),
      ),
    );
  }
}
