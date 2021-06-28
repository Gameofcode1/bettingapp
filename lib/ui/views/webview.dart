import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Urls extends StatelessWidget {
  Future<void> _launched;
  String _launchUrl="https://esewa.com.np/#/home";

  Future<void> _launchInBrowser(String url) async{
    if(await canLaunch(url)){
      await launch(url,forceSafariVC: false,forceWebView: true,
      headers: <String,String>{'header_key':'header_value'}
      );

    }
    else{
      throw("couldnot launch $url");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("esawa"),
      ),
      body: SafeArea(

        child: Container(),
      ),
    );
  }
}
