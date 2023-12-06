import 'package:flutter/material.dart';

import 'home.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },
          child: Icon(
            Icons.close,
            color: Colors.black,
            size: 18,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                top: 38,
                child: Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(100),
                    color: Colors.orangeAccent,
                    shape: BoxShape.circle,
                  ),
                )),
            Image(image: AssetImage("images/img.png"),fit: BoxFit.fitHeight,),
            Positioned(
                bottom: 30,
                child: Container(
                  width: w*0.9,
                  height: h*0.2,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Swaetshirts",style: TextStyle(color: Colors.white38,fontSize: h*0.018),),
                        Row(
                          children: [
                            Text(
                              "White&blackpantsuit",
                              style: TextStyle(color: Colors.white, fontSize: h*0.015),

                            ),
                            SizedBox(width: 50,),
                            Icon(Icons.favorite,color: Colors.orangeAccent,size: h*0.015,),
                          ],
                        ),SizedBox(height: 5,),
                        Row(
                          children: [
                            Icon(Icons.attach_money,color: Colors.white38,size: 20,),
                            SizedBox(height: 10,),
                            Text("665",style: TextStyle(color: Colors.white,fontSize:20 ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
                right: 10,
                top: 230,
                child: Container(
                  width: 75,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(

                            image: AssetImage("images/ma.png",),fit: BoxFit.cover,

                          ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),

                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/a1.png",),fit: BoxFit.cover,

                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/a2.png",),fit: BoxFit.cover,

                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/a4.png",),fit: BoxFit.cover,

                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/a3.png",),fit: BoxFit.cover,

                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
