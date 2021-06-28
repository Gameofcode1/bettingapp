import 'package:flutter/material.dart';
import 'package:betejee/core/modal/Provider/addbetting.dart';
import "dart:math";
import 'package:provider/provider.dart';

class Verified extends StatefulWidget {
  @override
  _VerifiedState createState() => _VerifiedState();
}

class _VerifiedState extends State<Verified> {
  void initState() {
    Provider.of<AddBetting>(context, listen: false)
        .fetchdata()
        .catchError((e) => print(e));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<AddBetting>(context, listen: true).items;
    print(items.length);
    final verify = items.where((element) => element.verify == true).toList();
    print(verify.length);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Verify"),
        ),
        body: Container(
          height: double.infinity,
          color: Colors.black,
          child:verify.length==0?Center(child: Text("No verified members pay to be Verified",style: TextStyle(color: Colors.white),)):GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: verify.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, index) {
                getRandomElement<T>(List<T> list) {
                  final random = new Random();
                  var i = random.nextInt(list.length);
                  return list[i];
                }

                var list = [
                  'images/cat.jpg',
                  'images/dog.jpg',
                  'images/tom and jery.jpg',
                ];
                var element = getRandomElement(list);
                return Container(
                  // alignment: Alignment.center,
                  // child: Text(element),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        child: Image(
                          image: AssetImage(element),
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        verify[index].name,
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        verify[index].firstcounty +
                            "(" +
                            verify[index].firstprednum.toString() +
                            ") - " +
                            verify[index].secondcountry +
                            "(" +
                            verify[index].secondprednum.toString() +
                            ")",
                        style: TextStyle(color: Colors.white70),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0,
                                  right: 30.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Text(
                                "Pay",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height / 60,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
