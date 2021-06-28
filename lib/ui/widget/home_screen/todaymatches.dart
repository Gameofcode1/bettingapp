import 'package:betejee/core/modal/todaymatches/matchesList.dart';
import 'package:betejee/ui/widget/Bottomsheet/bottomsheet.dart';
import 'package:betejee/ui/widget/home_screen/todaymatch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TodayMatches extends StatefulWidget {
  @override
  _TodayMatchesState createState() => _TodayMatchesState();
}

bool complete;
class _TodayMatchesState extends State<TodayMatches> {
  
  @override
  void initState() {
    setState(() {
      complete=true;
    });

   Provider.of<MatchesList>(context,listen: false).fetchdata().catchError((e)=>print(e));
   setState(() {
    complete=false;
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
     final items=Provider.of<MatchesList>(context,listen: false).items;
     var height=MediaQuery.of(context).size.height;
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (context, int index) {
          return complete?Container(height:80.0):
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  context: context,
                  builder: (context) => NewBottomSheet(id: items[index].id));
            },
            child: TodayMatch(
              id: items[index].id,
              firstimageUrl: items[index].firstimageUrl,
              firstname: items[index].firstname,
              secondImageUrl: items[index].secondImageUrl,
              secondname: items[index].secondname,
              datetime: items[index].datetime,
            ),
          );
        },
      ),
    );
  }
}
