import 'package:betejee/core/modal/Provider/addbetting.dart';
import 'package:betejee/core/modal/todaymatches/matchesList.dart';
import 'package:betejee/ui/views/betting.dart';
import 'package:betejee/ui/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(
        create: (context) => MatchesList(),),
        ChangeNotifierProvider(
        create: (context) => AddBetting(),)],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: MyHomePage(),
            theme: ThemeData(
            primaryColor: Colors.black,
            accentColor: Colors.black,
            fontFamily: 'Roboro'),
          routes: {  
            Betting.route:(content)=>Betting()    
          },
        )
      
 );
  }
}
