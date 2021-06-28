import 'package:betejee/core/modal/betting/betting.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddBetting with ChangeNotifier {
  List<BettingForm> _items = [];
  List<BettingForm> get items {
    return [..._items];
  }

 Future<void> fetchdata() async {
    var url = "https://bete-73e47-default-rtdb.firebaseio.com/bet.json";
    try {
      final response = await http.get(url);
      final extrateddata = json.decode(response.body) as Map<String, dynamic>;

      if (extrateddata == null) {
        print("null");
        return;
      }
      final List<BettingForm> newdata = [];
      extrateddata.forEach((id, data) {
        newdata.add(BettingForm(
            id: id,
            count: data['count'],
            firstcounty: data['firstcountry'],
            firstprednum: data['firstprediction'],
            name: data['name'],
            price: data['price'],
            secondcountry: data['secondcountry'],
            secondprednum: data['secondprediction'],
            verify: data['varify']));
      });
      _items = newdata;
      print(_items);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }


  Future<void> addproduct(BettingForm betting) async {
    var url = "https://bete-73e47-default-rtdb.firebaseio.com//bet.json";

    try {
      final response = await http.post(url,
          body: json.encode({
            'firstcountry': betting.firstcounty,
            'secondcountry': betting.secondcountry,
            'count': betting.count,
            'varify': betting.verify,
            'name': betting.name,
            'firstprediction': betting.firstprednum,
            'secondprediction': betting.secondprednum,
            'amount': betting.price
          }));

      final products = BettingForm(
          id: json.decode(response.body)['name'],
          count: betting.count,
          verify: betting.verify,
          name: betting.name,
          price: betting.price,
          firstprednum: betting.firstprednum,
          secondprednum: betting.secondprednum);

      _items.add(products);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
