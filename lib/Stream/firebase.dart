class Firebaseconstant{
  static const user= 'users';
  static const comment='comments';
}
// import 'dart:async';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:task3/home.dart';
//
// class Open extends StatefulWidget {
//   const Open({Key? key}) : super(key: key);
//
//   @override
//   State<Open> createState() => _OpenState();
// }
//
// class _OpenState extends State<Open> {
//   late SharedPreferences localStorage;
//
//   get currentUserId => null;
//
//   get currentUserEmail => null;
//
//   Future getValidationData() async{
//
//
//     localStorage = await SharedPreferences.getInstance();
//
//     // localStorage.remove('email');
//     var us =localStorage.getString('email').toString();
//     var id =localStorage.getString('id').toString();
//
//
//     setState(() {
//       var currentUserEmail = us;
//       var currentUserId = id;
//
//     });
//     print(currentUserId);
//     print(currentUserEmail);
//
//
//
//   }
//   @override
//   void initState() {
//     // Timer(Duration(seconds: 1), () {
//     //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OnBoarding(),), (route) => false);
//     //
//     // });
//     getValidationData().whenComplete(() async{
//
//
//       Timer(Duration(seconds: 2),() {
//
//         FirebaseAuth.instance
//             .userChanges()
//             .listen((User? user) {
//           if (user == null) {
//             if((currentUserId!=null||currentUserId!='null')&&user != null){
//               print('1:1');
//               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Navigation(index:0),), (route) => false);
//
//
//             }else{
//               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyApp6(),), (route) => false);
//
//               print('1:2');
//
//             }
//           } else {
//             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Navigation(index:0),), (route) => false);
//
//             print('User is signed in!');
//           }
//         });
//
//
//         setState((){});
//
//
//
//       }
//
//       );
//
//     } );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade900,
//       body: const Center(
//       child: Text("THRIFTY",
//       style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w500,
//           fontSize: 65,
//           fontFamily: "JosefinSans"),)