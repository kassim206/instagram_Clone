// import 'dart:async';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import '../Auth/Authentication.dart';
// import '../Stream/firebase.dart';
// import '../model/accountmodels.dart';
// import '../model/story_model.dart';
// class StoryView extends StatefulWidget {
//   StoryModel? data;
//
//   StoryView({super.key,required this.data});
//
//   @override
//   State<StoryView> createState() => _StoryViewState();
// }
//
// class _StoryViewState extends State<StoryView> {
//   Stream str() {
//     return  FirebaseFirestore.instance.collection(Firebaseconstant.user).doc(currentUserId).collection('story')
//         .snapshots().map((event) => event.docs.map((e) => StoryModel.fromJson(e.data())).toList());
//   }
//
//   double percent=0.0;
//   late Timer _timer;
//   void startTimer(){
//     _timer =Timer.periodic(Duration(milliseconds: 5), (timer) {
//      setState(() {
//        percent+=0.001;
//        if(percent >1){
//          _timer.cancel();
//          Navigator.pop(context);
//        }
//      });
//     });
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     startTimer();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: Stack(
//       //   children: [
//       //     // StreamBuilder(
//       //     //   stream: str(),
//       //     //   builder: (context, snapshot) {
//       //     //
//       //     //     if(snapshot.hasData){
//       //     //
//       //     //       List<StoryModel>media =snapshot.data;
//       //     //
//       //     //
//       //     //             print("@@@@@@@@@@@@@@@GFFFFFFFFFFFFFFFF");
//       //                 return
//       //
//                    body:   Stack(
//                      children: [
//                        Container(
//                          width: double.infinity,
//                          height: double.infinity,
//                          // decoration: BoxDecoration(
//                          //         fit: BoxFit.cover)
//                          child: Image(image:NetworkImage(widget.data!.storyUrl.toString()),fit: BoxFit.cover,),
//                      ),
//                        Column(
//                          children: [
//                            Padding(
//                              padding: const EdgeInsets.symmetric(vertical: 31.0,horizontal: 8.0),
//                              child: LinearProgressIndicator(
//                                value: percent,
//                              ),
//                            ),
//                            SizedBox(height: 3.0,),
//                            Row(
//                              children: [
//                                CircleAvatar(
//                                  radius: 25.0,
//                                  backgroundImage: NetworkImage(usersmodel!.imageUrl.toString()),
//                                ),
//                                SizedBox(width: 8.0,),
//                                Text(  widget.data!.userName.toString(),style: TextStyle(color: Colors.white,fontSize: 18.0),)
//                              ],
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//
//
//               // }else{
//               //   return Center(child: CircularProgressIndicator());
//               // }
//
//             // }
//       //     ),
//       //     // Padding(
//       //     //   padding: EdgeInsets.symmetric(vertical: 36.0,horizontal: 8.0),
//       //     //   child: Column(
//       //     //     children: [
//       //     //
//       //     //     ],
//       //     //   ),
//       //     // ),
//       //   ],
//       // ),
//     );
//   }
// }
