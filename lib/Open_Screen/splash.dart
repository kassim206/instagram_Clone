import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/home_Screen/home.dart';
import 'package:task3/register/login.dart';
import '../Auth/Authentication.dart';
import '../model/accountmodels.dart';
import '../Stream/firebase.dart';
import '../navBottomBar/navigate.dart';

class openscreen extends StatefulWidget {
  const openscreen({super.key});

  @override
  State<openscreen> createState() => _openscreenState();
}

class _openscreenState extends State<openscreen> {
  bool login = false;

  localstorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getBool("isLogged"));
    if (prefs.getBool('isLogged') != null) {
      setState(() {
        login = prefs.getBool('isLogged')!;
      });
      print(prefs.getString("userUid"));
      currentUserId = prefs.getString('userUid');
      usersmodel = await getUser(currentUserId);
      var updatedata = usersmodel!.copyWith(lastLogged: DateTime.now());
      FirebaseFirestore.instance
          .collection(Firebaseconstant.user)
          .doc(currentUserId)
          .update(updatedata!.toJson());
    }
  }
  navigateTopage() {
    Timer(Duration(seconds: 3), () {
      login
          ? Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
              (route) => false)
          : Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => loginpage()),
              (route) => false);
    });
  }
  @override
  // getValidation()async {
  //   final localStorage = await SharedPreferences.getInstance();
  //   bool log = localStorage.containsKey('email');
  //   if (log) {
  //     currentUserId = localStorage.getString('email')!;
  //     login = true;
  //     setState(() {
  //
  //     });
  //     var us = localStorage.getString('email').toString();
  //     var id = localStorage.getString('uid');
  //   }
  // }

  void initState() {
    localstorage();
    navigateTopage();
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: const Center(
            child: Text(
          "THRIFTY",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 65,
              fontFamily: "JosefinSans"),
        )));
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.blue.shade900,
//     body: const Center(
//         child: Text("THRIFTY",
//           style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.w500,
//               fontSize: 65,
//               fontFamily: "JosefinSans"),)
