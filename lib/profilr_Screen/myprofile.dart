import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task3/home_Screen/home.dart';
import 'package:task3/profilr_Screen/profedit.dart';
import 'package:task3/profilr_Screen/profile.dart';
import '../Auth/Authentication.dart';
import 'Userfollow.dart';
import 'Userunfollow.dart';
import '../Stream/firebase.dart';
import '../Stream/gridViewpage1.dart';
import '../model/MediaModels.dart';
import '../model/accountmodels.dart';

class MYProfile extends StatefulWidget {
  const MYProfile({super.key});

  @override
  State<MYProfile> createState() => _MYProfileState();
}

class _MYProfileState extends State<MYProfile> {
  var imagecopy;
  update({required ImageSource media}) async {

    ImagePicker imagePicker=ImagePicker();
    XFile? file=await imagePicker.pickImage(source: media);
    var ref=FirebaseStorage.instance.ref().child("kassim/image-${DateTime.now()}");
    UploadTask uploadTask =ref.putFile(File(file!.path));
    uploadTask.then((p0) async =>
    imagecopy= (await ref.getDownloadURL()).toString()).then((value) {
      print(imagecopy);
      setState(() {

      });
      var a=usersmodel?.copyWith(
          imageUrl: imagecopy
      );
      FirebaseFirestore.instance.collection(Firebaseconstant.user).doc(currentUserId).update(
          a!.toJson()
      );
    });
    // var image=await ref.getDownloadURL();
    // print("====================================================$image");

   Stream post(){
        return FirebaseFirestore.instance.collection(Firebaseconstant.user).doc(currentUserId).collection('Post')
            .snapshots().map((event) => event.docs.map((e) => MediaModel.fromJson(e.data())).toList());
   }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                color: Colors.blueAccent,
                width: w,
                height: 310,
                child: Stack(
                  children: [
                    Positioned(
                      top: 28,
                      child: Container(
                        width: w * 400,
                        height: 290,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: NetworkImage(
                                        "https://t4.ftcdn.net/jpg/00/40/86/85/240_F_40868511_z0T2aLzB7V6xd0lV7Bxc7DYNOynV0Dkp.jpg"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  SizedBox(height: 5,),
                                  Text("Kassim.C")
                                ],
                              ),
                            ),
                            Positioned(
                              top: 40,
                              left: 120,
                              child: Container(
                                width: 60,
                                height: 60,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Center(
                                        child: Text(
                                      "3",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )),
                                    Text("Post")
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 40,
                              left: 190,
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Followers()));
                                },
                                child: Container(
                                  width: 70,
                                  height: 60,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Center(
                                          child: Text(
                                        "100",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      )),
                                      Text("Following")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 40,
                              left: 270,
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UnFollowers()));
                                },
                                child: Container(
                                  width: 70,
                                  height: 60,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Center(
                                          child: Text(
                                        "100",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      )),
                                      Text("Followers")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 155,
                              left: 10,
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Editprofile()));
                                },
                                child: Container(
                                  width: 130,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[200],
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 155,
                              left: 155,
                              child: Container(
                                width: 130,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[200],
                                ),
                                child: Center(
                                  child: Text(
                                    "Share Profile",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 155,
                              left: 295,
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>proverified()));
                                },
                                child: Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey[200],
                                    ),
                                    child: Icon(Icons.person_add,)),
                              ),
                            ),
                            Positioned(
                              top: 3,
                              left: 295,
                              child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: GestureDetector(
                                    onTap: (){
                                      update(media: ImageSource.gallery);
                                    },
                                      child: Icon(Icons.add_box,))),
                            ),
                            Positioned(
                              top: 200,
                              left: 10,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 40.0,
                                      backgroundImage: NetworkImage(
                                          "https://t4.ftcdn.net/jpg/00/40/86/85/240_F_40868511_z0T2aLzB7V6xd0lV7Bxc7DYNOynV0Dkp.jpg"),
                                      backgroundColor: Colors.transparent,
                                      // child: Text("Women",style: TextStyle(color: Colors.black),),
                                    ),
                                    SizedBox(
                                      width: w * .03,
                                    ),
                                    CircleAvatar(
                                      radius: 40.0,
                                      backgroundImage: NetworkImage(
                                          "https://t4.ftcdn.net/jpg/00/40/86/85/240_F_40868511_z0T2aLzB7V6xd0lV7Bxc7DYNOynV0Dkp.jpg"),
                                      backgroundColor: Colors.transparent,
                                      // child: Text("Women",style: TextStyle(color: Colors.black),),
                                    ),
                                    SizedBox(
                                      width: w * .03,
                                    ),
                                    CircleAvatar(
                                      radius: 40.0,
                                      backgroundImage: NetworkImage(
                                          "https://t4.ftcdn.net/jpg/00/40/86/85/240_F_40868511_z0T2aLzB7V6xd0lV7Bxc7DYNOynV0Dkp.jpg"),
                                      backgroundColor: Colors.transparent,
                                      // child: Text("Women",style: TextStyle(color: Colors.black),),
                                    ),
                                    SizedBox(
                                      width: w * .03,
                                    ),
                                    CircleAvatar(
                                      radius: 40.0,
                                      backgroundImage: NetworkImage(
                                          "https://t4.ftcdn.net/jpg/00/40/86/85/240_F_40868511_z0T2aLzB7V6xd0lV7Bxc7DYNOynV0Dkp.jpg"),
                                      backgroundColor: Colors.transparent,
                                      // child: Text("Women",style: TextStyle(color: Colors.black),),
                                    ),
                                    SizedBox(
                                      width: w * .03,
                                    ),
                                    CircleAvatar(
                                      radius: 40.0,
                                      backgroundImage: NetworkImage(
                                          "https://t4.ftcdn.net/jpg/00/40/86/85/240_F_40868511_z0T2aLzB7V6xd0lV7Bxc7DYNOynV0Dkp.jpg"),
                                      backgroundColor: Colors.transparent,
                                      // child: Text("Women",style: TextStyle(color: Colors.black),),
                                    ),
                                    SizedBox(
                                      width: w * .03,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Positioned(
                    //   top: 320,
                    //   left: 5,
                    //   child: GestureDetector(
                    //     onTap: (){
                    //       showDialog(context: context, builder: (context) {
                    //
                    //         return AlertDialog(
                    //           content: Column(
                    //             children: [
                    //               InteractiveViewer(
                    //                 child: Image(image: NetworkImage('https://images.unsplash.com/photo-1583778185841-bcbf4e9f3fe8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60'),
                    //                 ),
                    //               ),
                    //               Row(
                    //                 children: [
                    //                   Icon( Icons.favorite_border, ),
                    //                   Icon(  Icons.chat_bubble_outline,  ),
                    //                   Icon( Icons.share, )
                    //
                    //                 ],
                    //               )
                    //             ],
                    //           ),
                    //
                    //         );
                    //       },);
                    //     },
                    //     child: Container(
                    //       width: 116,
                    //       height: 110,
                    //       decoration: BoxDecoration(
                    //           image: DecorationImage(
                    //               image: NetworkImage(
                    //                   "https://images.unsplash.com/photo-1583778185841-bcbf4e9f3fe8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"),
                    //               fit: BoxFit.cover)),
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   top: 320,
                    //   left: 123,
                    //   child: Container(
                    //     width: 116,
                    //     height: 110,
                    //
                    //     decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(imagecopy??""),fit: BoxFit.cover)),
                    //   ),
                    // ),
                    // Positioned(
                    //   top: 320,
                    //   left: 241,
                    //   child: Container(
                    //     width: 116,
                    //     height: 110,
                    //
                    //     decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(imagecopy??""),fit: BoxFit.cover)),
                    //   ),
                    // ),
                    // TabBar(
                    //   tabs: [
                    //     Tab(icon: Icon(Icons.directions_car)),
                    //     Tab(icon: Icon(Icons.directions_transit)),
                    //     Tab(icon: Icon(Icons.directions_bike)),
                    //   ],
                    // ),
                    // TabBarView(
                    //   children: [
                    //     Icon(Icons.directions_car),
                    //     Icon(Icons.directions_transit),
                    //     Icon(Icons.directions_bike),
                    //   ],
                    // ),
                  ]
                ),
              ),
              TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.image,color: Colors.black,)),
                  Tab(icon: Icon(Icons.video_collection,color: Colors.black,)),
                  Tab(icon: Icon(Icons.directions_bike,color: Colors.black,)),
                ],
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: h*0.5,
                child: TabBarView(children: [
                  GridPage_post(),
                  Text('halo'),
                  Text('halo'),
                ],),

              ),
              // GridView.builder(gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              //    itemBuilder: (BuildContext context,int index){
              //   return Card(
              //     child: Image(image: NetworkImage(""),));
              //    },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
