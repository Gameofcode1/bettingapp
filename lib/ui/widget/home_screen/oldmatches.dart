import 'package:betejee/core/modal/todaymatches/matchesList.dart';
import 'package:betejee/ui/widget/home_screen/todaymatch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Oldmatches extends StatefulWidget {
  @override
  _OldmatchesState createState() => _OldmatchesState();
}

class _OldmatchesState extends State<Oldmatches> {
  @override
  void initState() {
    Provider.of<MatchesList>(context,listen: false).fetcholddata().catchError((e)=>print(e));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final items=Provider.of<MatchesList>(context,listen: false).olditems;
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (context, int index) {
          return Container(
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
