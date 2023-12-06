import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task3/Auth/Authentication.dart';
import 'package:task3/model/accountmodels.dart';
import 'package:task3/unfiles/datas.dart';
import 'package:task3/home_Screen/home.dart';

import '../Cards/Singleusercard.dart';
import '../Stream/firebase.dart';
class proverified extends StatefulWidget {
  const proverified({super.key});

  @override
  State<proverified> createState() => _proverifiedState();
}

class _proverifiedState extends State<proverified> {


  TextEditingController _getsearch=TextEditingController();
  Stream<List<UsersModel>> userStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .where("uid",isNotEqualTo: currentUserId)
        .snapshots()
        .map((querySnapshot) {

      return querySnapshot.docs
          .map((documentSnapshot) => UsersModel.fromJson(documentSnapshot.data()))
          .toList();
    });
  }
  Stream<List<UsersModel>> usersearchStream() {
    return FirebaseFirestore.instance
        .collection('users').where("userName",isEqualTo: _getsearch.text)
         .where("uid",isNotEqualTo: currentUserId)
        .snapshots()
        .map((querySnapshot) {

      return querySnapshot.docs
          .map((documentSnapshot) => UsersModel.fromJson(documentSnapshot.data()))
          .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(child: Text("User List",
          style: TextStyle(color: Colors.black, fontSize: h * .03),)),
      ),
      body:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: StreamBuilder(
          stream:_getsearch.text.isNotEmpty? usersearchStream():userStream(),
          builder: (context, snapshot) {
            //print(snapshot.error);
            if (snapshot.hasData) {
              List<UsersModel>?data = snapshot.data;
              // print(snapshot.error);
              return Column(
                children: [
                  TextFormField(
                    onChanged: (value){
                      print(_getsearch.text);
                      setState(() {

                      });
                    },
                    controller: _getsearch,
                    decoration: InputDecoration(
                      suffixIconColor: Colors.black,
                      prefixIconColor: Colors.black,
                      prefixIcon: Icon(Icons.search),

                      suffixIcon:
                      _getsearch.text.isNotEmpty?
                      InkWell(
                          onTap: (){
                            setState(() {
                              _getsearch.clear();
                            });
                          },
                          child: Icon(Icons.clear,)):null,
                      hintText: "Search here",
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        if(_getsearch.text.isEmpty) {
                          return Column(
                            children: [
                             Usercard(
                               index: index,
                               data: data[index],
                             ),

                              // Divider(
                              //   thickness: h * .001,
                              //   color: Colors.black,
                              // ),
                            ],
                          );
                        }
                        else if(data[index].userName!.toLowerCase().toString().contains(_getsearch.text.toLowerCase())||
                            data[index].userEmail!.toLowerCase().toString().contains(_getsearch.text.toLowerCase()))
                        {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Usercard(
                                  index: index,
                                  data: data[index],
                                ),
                              ),
                              // Divider(
                              //   thickness: h * .001,
                              //   color: Colors.black,
                              // ),
                            ],
                          )
                          ;
                        }
                        else{
                          return Container();
                        }
                      },
                      itemCount: data!.length),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
        // bottomNavigationBar: CurvedNavigationBar(
        //   color: Colors.black,
        //   backgroundColor: Colors .white,
        //   buttonBackgroundColor: Colors.black,
        //   animationDuration: Duration(milliseconds: 300),
        //   animationCurve: Curves.bounceInOut,
        //   height: 70,
        //   index: 2,
        //   items: [
        //     InkWell(
        //         onTap: (){
        //           Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp6()));
        //         },
        //         child: Icon(Icons. home_outlined, size: 30, color: Colors.white)),
        //     Icon(Icons. search_outlined, size: 30, color: Colors.white),
        //     Icon (Icons.add, size: 30, color: Colors.white),
        //     Icon(Icons.bookmark_border_outlined, size: 30, color: Colors.white),
        //     InkWell(onTap: (){
        //       Navigator.push(context, MaterialPageRoute(builder: (context)=>proverified()));
        //     },
        //         child: Icon(Icons .person_add, size: 30, color: Colors.white)),
        //
        //   ],
        //   onTap: (index)
        //   {
        //     print("$index");
        //   },
        // )
    );
  }
}

