import 'package:betejee/core/modal/todaymatches/matches.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MatchesList with ChangeNotifier {
  List<TodayMatche> _items = [
  ];

  List<TodayMatche> get items {
    return [..._items];
  }


List<TodayMatche> _olditems=[];
List<TodayMatche> get  olditems {
    return [..._olditems];
  }
  


  Future<void> fetcholddata() async {
    var url = "https://bete-73e47-default-rtdb.firebaseio.com/oldmatches.json";
    try {
      final response = await http.get(url);
      final extrateddata = json.decode(response.body) as Map<String, dynamic>;
      print(extrateddata);
      if (extrateddata == null) {
        print("null");
        return;
      }
      final List<TodayMatche> newdata = [];
      extrateddata.forEach((id, data) {
        newdata.add(TodayMatche(
            id: id,
            count: data['count'],
            datetime: data['time'],
            firstimageUrl: data['firstlogo'],
            firstname: data['firstname'],
            secondImageUrl: data['secondlogo'],
            secondname: data['secondname']));
      });
      print(newdata);
      _olditems = newdata;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> fetchdata() async {
    var url = "https://bete-73e47-default-rtdb.firebaseio.com/matches.json";
    try {
      final response = await http.get(url);
      final extrateddata = json.decode(response.body) as Map<String, dynamic>;
      print(extrateddata);
      if (extrateddata == null) {
        print("null");
        return;
      }
      final List<TodayMatche> newdata = [];
      extrateddata.forEach((id, data) {
        newdata.add(TodayMatche(
            id: id,
            count: data['count'],
            datetime: data['time'],
            firstimageUrl: data['firstlogo'],
            firstname: data['firstname'],
            secondImageUrl: data['secondlogo'],
            secondname: data['secondname']));
      });

      print(newdata);
      _items = newdata;
      print(_items);
      notifyListeners();
    } catch (error) {
      print(_items);
      throw error;
    }
  }
}
