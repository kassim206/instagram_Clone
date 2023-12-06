import 'package:flutter/material.dart';
import 'package:task3/pages/page.dart';
import 'package:task3/home_Screen/womopn.dart';

import '../unfiles/datas.dart';
import '../unfiles/deltas.dart';

var height;
var width;
class favorites extends StatefulWidget {
  const favorites({super.key});

  @override
  State<favorites> createState() => _favoritesState();
}

class _favoritesState extends State<favorites> {
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
        size: 22,
      ),
    ),
    title: Text("favourites",style: TextStyle(color: Colors.black,fontSize: 25),),
      ),
      body:   ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: Colors.white,
                width: 400,
                height: 160,
              ),
              Positioned(
                top: 30,
                left: 25,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page3(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(245, 245, 245, 1),
                        borderRadius: BorderRadius.circular(15)),
                    width: 310,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  models[index]["Nick"].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                                // SizedBox(width: 70 ,),


                              ],
                            ),
                            Text(
                              models[index]["Name"].toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  color: Colors.red,
                                  size: 15,
                                ),
                                Text(
                                  models[index]["price"].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 200,
                child: Image(
                    height: 120, image: AssetImage("images/"+models[index]["img"].toString())),
              )
            ],
          );
        }),
    );
  }
}
