import 'package:flutter/material.dart';
import 'package:task3/home_Screen/favourite.dart';
import 'package:task3/home_Screen/womopn.dart';



import 'datas.dart';
import '../home_Screen/home.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              title: Center(
                  child: Text(
                "WOMEN",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              )),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: IconButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  favorites(),
                        ),
                      );
                    },icon: Icon(Icons.favorite,color: Colors.redAccent,),
                  )
                )
              ],
              bottom: TabBar(

                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text(
                      "All",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Shirts",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Jeans",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Jackets",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Shoes",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                  ),
                ],
              )),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Container(

                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: w*0.870,
                  height: h*0.06,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search,
                              color: Colors.black, size: 30),
                          suffixIcon: Icon(
                            Icons.drag_handle,
                          ),
                          hintText: 'Search',
                          filled: true,
                          fillColor: Color.fromRGBO(245, 245, 245, 1),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                    physics: ScrollPhysics(),
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
                                builder: (context) => const Page3(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 245, 245, 1),
                                borderRadius: BorderRadius.circular(15)),
                            width: 310,
                            height: h*0.4,
                            child:Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60.0),
                                      child: Text(
                                        models[index]["Nick"].toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18),
                                      ),
                                    ),



                                    IconButton(onPressed: (){
                                      setState(() {
                                        models[index]["fav"]=!models[index]["fav"];
                                      });
                                    }, icon: Icon((models[index]["fav"]==false)?Icons.favorite_border:Icons.favorite,
                                      color: (models[index]["fav"]==false)?Colors.black:Colors.red,))
                                  ],
                                ),
                                Text(
                                  models[index]["Name"].toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.currency_rupee,
                                      color: Colors.black,
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
                })
              ],
            ),
          ),
        ));
  }
}
