import 'package:betejee/core/modal/Provider/addbetting.dart';
import 'package:betejee/core/modal/betting/betting.dart';
import 'package:betejee/core/modal/todaymatches/matchesList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BettingForms extends StatefulWidget {
  final String id;
  BettingForms({this.id});
  @override
  _BettingFormsState createState() => _BettingFormsState();
}

class _BettingFormsState extends State<BettingForms> {
  final _key = GlobalKey<FormState>();

  final firtprednum = FocusNode();
  final price = FocusNode();
  final secondprednum = FocusNode();

  var _editedproduct = BettingForm(
      firstcounty: '',
      secondcountry: '',
      count: 0,
      id: null,
      firstprednum: 0,
      name: "",
      price: 0,
      verify: false,
      secondprednum: 0);

  Future<void> _onsave() async {
    final isvalide = _key.currentState.validate();
    if (!isvalide) {
      return;
    }
    _key.currentState.save();
    try {
      await Provider.of<AddBetting>(context, listen: false)
          .addproduct(_editedproduct);
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: Colors.black,
          title: Text('Saved to unverified',style: TextStyle(color: Colors.white),),
          content: Text('Pay to be verified and take part in bet',style: TextStyle(color: Colors.white),),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay',style: TextStyle(color: Colors.red),),
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    } catch (error) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                backgroundColor: Colors.red,
                title: Text(
                  'Error Occur',
                  style: TextStyle(color: Colors.white),
                ),
                content: Text('Please try again later',
                    style: TextStyle(color: Colors.white)),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Okay', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      Navigator.pop(context);
                    },
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<MatchesList>(context)
        .items
        .firstWhere((items) => items.id == widget.id);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Form(
          key: _key,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                          bottom: height / 30, right: width / 1.2),
                      child: Icon(Icons.arrow_back_ios, color: Colors.white)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30.0, left: 7.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(children: [
                        Image(
                            height: height / 13,width: width/10,
                        
                            image: NetworkImage(product.firstimageUrl)),
                        Container(
                          margin: EdgeInsets.only(
                            left: height / 60,
                          ),
                          child: Text(
                            product.firstname,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: height / 50,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ])),
                      Expanded(
                        child: Row(children: [
                          Image(
                              height: height / 13,
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
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
                Theme(
                  data: new ThemeData(
                    fontFamily: 'Roboro',
                    primaryColor: Colors.white60,
                    primaryColorDark: Colors.white60,
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white54),

                    // style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(firtprednum);
                    },
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white54),
                      labelText: "name",
                      hintStyle: TextStyle(color: Colors.white54),
                      hintText: "Enter your name",
                      fillColor: Colors.orange,
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white)),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return ("enter the value");
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _editedproduct = _editedproduct = BettingForm(
                          firstcounty: product.firstname,
                          secondcountry: product.secondname,
                          count: product.count,
                          id: _editedproduct.id,
                          firstprednum: _editedproduct.firstprednum,
                          name: value,
                          price: _editedproduct.price,
                          verify: _editedproduct.verify,
                          secondprednum: _editedproduct.secondprednum);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height / 40),
                  child: Theme(
                    data: new ThemeData(
                      fontFamily: 'Roboro',
                      primaryColor: Colors.white60,
                      primaryColorDark: Colors.white60,
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white54),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: firtprednum,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(secondprednum);
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white54),
                          hintStyle: TextStyle(color: Colors.white54),
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: product.firstname,
                          hintText: "prediction"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return ("enter the value");
                        } else if (value.length > 1) {
                          return ("enter only singlre input");
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _editedproduct = _editedproduct = BettingForm(
                            firstcounty: product.firstname,
                            secondcountry: product.secondname,
                            count: product.count,
                            id: _editedproduct.id,
                            firstprednum: int.parse(value),
                            name: _editedproduct.name,
                            price: _editedproduct.price,
                            verify: _editedproduct.verify,
                            secondprednum: _editedproduct.secondprednum);
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height / 40),
                  child: Theme(
                    data: new ThemeData(
                      fontFamily: 'Roboro',
                      primaryColor: Colors.white60,
                      primaryColorDark: Colors.white60,
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white54),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: secondprednum,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(price);
                      },
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelStyle: TextStyle(color: Colors.white54),
                          hintStyle: TextStyle(color: Colors.white54),
                          labelText: product.secondname,
                          hintText: "prediction"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return ("enter the value");
                        } else if (value.length > 1) {
                          return ("enter only singlre input");
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _editedproduct = _editedproduct = BettingForm(
                            firstcounty: product.firstname,
                            secondcountry: product.secondname,
                            count: product.count,
                            id: _editedproduct.id,
                            firstprednum: _editedproduct.firstprednum,
                            name: _editedproduct.name,
                            price: _editedproduct.price,
                            verify: _editedproduct.verify,
                            secondprednum: int.parse(value));
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height / 40),
                  child: Theme(
                    data: new ThemeData(
                      fontFamily: 'Roboro',
                      primaryColor: Colors.white60,
                      primaryColorDark: Colors.white60,
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white54),
                      textInputAction: TextInputAction.done,
                      focusNode: price,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (_) {},
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelStyle: TextStyle(color: Colors.white54),
                          hintStyle: TextStyle(color: Colors.white54),
                          labelText: "Amount",
                          hintText: "Amount"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return ("enter the value");
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _editedproduct = _editedproduct = BettingForm(
                            firstcounty: product.firstname,
                            secondcountry: product.secondname,
                            count: product.count,
                            id: _editedproduct.id,
                            firstprednum: _editedproduct.firstprednum,
                            name: _editedproduct.name,
                            price: int.parse(value),
                            verify: _editedproduct.verify,
                            secondprednum: _editedproduct.secondprednum);
                      },
                    ),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _onsave();
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: height / 20),
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
                        child: Text(
                          "Bet",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: height / 60,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
