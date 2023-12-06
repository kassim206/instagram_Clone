import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/model/accountmodels.dart';
import 'package:task3/register/login.dart';
import 'package:task3/unfiles/woman.dart';
import '../profilr_Screen/myprofile.dart';

var w;
var h;

class MyApp6 extends StatefulWidget {
  const MyApp6({super.key});

  @override
  State<MyApp6> createState() => _MyApp6State();
}

class _MyApp6State extends State<MyApp6> {
//   final images = [
//   "https://images.unsplash.com/photo-1488161628813-04466f872be2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fG1vZGVsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"
// "https://images.unsplash.com/photo-1583778185841-bcbf4e9f3fe8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"
//   ];a
  // final PageController = PageController(viewportFraction:0.8);
  GlobalKey<ScaffoldState> _key = GlobalKey();
// getData(){
//   FirebaseFirestore.instance.collection(FirebaseConstants.user).doc(currentUserId).snapshots().listen((event) {
//
//   });
// }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
    print("----------");
    // print(usersmodel!.userName.toString());
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.notes,
              color: Colors.black,
            ),
          ),
        ),
        title: Center(
            child: Text(
          "THRIFTY",
          style: GoogleFonts.aladin(color: Colors.black, fontSize: 18),
        )),
        actions: [
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                onPressed: () {},
                icon: InkWell(
                    child: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.black,
                )),
              ))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black38,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(usersmodel!.userName.toString()),
              accountEmail: Text(usersmodel!.userEmail.toString()),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(usersmodel!.imageUrl.toString()),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
                size: 25,
              ),
              title: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MYProfile()));
                  },
                  //Editprofile
                  child: Text(
                    "profile",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
                size: 25,
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.dashboard,
                color: Colors.white,
                size: 25,
              ),
              title: Text(
                "Dash board",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
                size: 25,
              ),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {
                GoogleSignIn().signOut().then((value) async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove('isLogged');

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => loginpage(),
                      ),
                      (route) => false);
                });
              },
            )
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: w * .06,
                        // height: 20,
                      ),
                      Container(
                        width: w * .8,
                        height: h * 0.55,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 80.0,
                            top: 20,
                          ),
                          child: Text(
                            "NEW ARRIVALS",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1583778185841-bcbf4e9f3fe8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: w * .09,
                        // height: 20,
                      ),
                      Container(
                        width: w * .8,
                        height: h * 0.55,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 80.0,
                            top: 20,
                          ),
                          child: Text(
                            "NEW ARRIVALS",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://c4.wallpaperflare.com/wallpaper/482/656/985/female-celebrities-scarlett-johansson-wallpaper-preview.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: w * .09,
                        // height: 20,
                      ),
                      Container(
                        width: w * .8,
                        height: h * 0.55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fG1vZGVsfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: w * .09,
                        // height: 20,
                      ),
                      Container(
                        width: w * .8,
                        height: h * 0.55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://c4.wallpaperflare.com/wallpaper/482/656/985/female-celebrities-scarlett-johansson-wallpaper-preview.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: w * .06,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: w * 0.7,
                height: h * .002,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30)),
                alignment: Alignment.centerLeft,
                child: Container(
                  width: w * 0.15,
                  height: h * 0.002,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: h * .01,
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: w * .03,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage: NetworkImage(
                              "https://t4.ftcdn.net/jpg/00/40/86/85/240_F_40868511_z0T2aLzB7V6xd0lV7Bxc7DYNOynV0Dkp.jpg"),
                          backgroundColor: Colors.transparent,
                          // child: Text("Women",style: TextStyle(color: Colors.black),),
                        ),
                        SizedBox(
                          height: h * .01,
                        ),
                        Text(
                          "Man",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      width: w * .03,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Task();
                            }));
                          },
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage: NetworkImage(
                                "https://t3.ftcdn.net/jpg/04/99/75/08/240_F_499750859_zF8aKnU5iGHfru6ISYbndRHvATkgjllm.jpg"),
                            backgroundColor: Colors.transparent,
                            // child: Text("Women",style: TextStyle(color: Colors.black),),
                          ),
                        ),
                        SizedBox(
                          height: h * .01,
                        ),
                        Text(
                          "Women",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      width: w * .03,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage: NetworkImage(
                              "https://t4.ftcdn.net/jpg/03/81/28/29/240_F_381282958_nAuczILQdP0pYcxqLFH0JdzC1vsq0Wme.jpg"),
                          backgroundColor: Colors.transparent,
                          // child: Text("Women",style: TextStyle(color: Colors.black),),
                        ),
                        SizedBox(
                          height: h * .01,
                        ),
                        Text(
                          "Kids",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      width: w * .03,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage: NetworkImage(
                              "https://t4.ftcdn.net/jpg/01/51/99/39/240_F_151993994_mmAYzngmSbNRr6Fxma67Od3WHrSkfG5I.jpg"),
                          backgroundColor: Colors.transparent,
                          // child: Text("Women",style: TextStyle(color: Colors.black),),
                        ),
                        SizedBox(
                          height: h * .01,
                        ),
                        Text(
                          "Specs",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      width: w * .03,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c2hvZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60"),
                          backgroundColor: Colors.transparent,
                          // child: Text("Women",style: TextStyle(color: Colors.black),),
                        ),
                        SizedBox(height: h * .01),
                        Text(
                          "Sheos",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 0,
      //     backgroundColor: Colors.white,
      //     items:  <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home, color: Colors.black,),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.category, color: Colors.black,),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_bag, color: Colors.black,),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: InkWell(
      //           onTap: (){
      //             Navigator.of(context).push(MaterialPageRoute(builder: (context){
      //               return proverified();
      //             }));
      //           },
      //             child: Icon(Icons.person_search, color: Colors.black,)),
      //         label: '',
      //       ),
      //
      //     ]),
      //    bottomNavigationBar: CurvedNavigationBar(
      //        color: Colors.white,
      //        backgroundColor: Colors .purpleAccent,
      //        buttonBackgroundColor: Colors.white,
      //        animationDuration: Duration(milliseconds: 300),
      //        animationCurve: Curves.bounceInOut,
      //        height: 70,
      //        index: 2,
      //        items: [
      //        InkWell(
      //            onTap: (){
      //              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp6()));
      //            },
      //            child: Icon(Icons. home_outlined, size: 30, color: Colors.black)),
      //    Icon(Icons. search_outlined, size: 30, color: Colors.black),
      //    Icon (Icons.add, size: 30, color: Colors.black),
      //    Icon(Icons.bookmark_border_outlined, size: 30, color: Colors.black),
      //    InkWell(onTap: (){
      //      Navigator.push(context, MaterialPageRoute(builder: (context)=>proverified()));
      //    },
      //        child: Icon(Icons .person_add, size: 30, color: Colors.black)),
      //
      //    ],
      //    onTap: (index)
      // {
      //   print("$index");
      // },
      //    )
      //    bottomNavigationBar: CurvedNavigationBar(
      //      color: Colors.black,
      //      backgroundColor: Colors .white,
      //      buttonBackgroundColor: Colors.black,
      //      animationDuration: Duration(milliseconds: 300),
      //      animationCurve: Curves.bounceInOut,
      //      height: 60,
      //      index: 2,
      //      items: [
      //        InkWell(
      //            onTap: (){
      //              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp6()));
      //            },
      //            child: Icon(Icons. home_outlined, size: 30, color: Colors.white)),
      //        Icon(Icons. search_outlined, size: 30, color: Colors.white),
      //        InkWell(
      //            onTap: (){
      //              Navigator.push(context, MaterialPageRoute(builder: (context) => Post()));
      //            },
      //            child: Icon (Icons.add, size: 30, color: Colors.white)),
      //        InkWell(
      //          onTap: (){
      //            Navigator.push(context, MaterialPageRoute(builder: (context) => FeedScreen()));
      //          },
      //            child: Icon(Icons.bookmark_border_outlined, size: 30, color: Colors.white)),
      //        InkWell(onTap: (){
      //          Navigator.push(context, MaterialPageRoute(builder: (context)=>proverified()));
      //        },
      //            child: Icon(Icons .person_add, size: 30, color: Colors.white)),
      //
      //      ],
      //      onTap: (index)
      //      {
      //        print("$index");
      //      },
      //    )
    );
  }
}
