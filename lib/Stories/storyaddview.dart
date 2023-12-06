import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task3/Auth/Authentication.dart';
import 'package:task3/model/accountmodels.dart';
import 'package:task3/model/story_model.dart';

import '../Stream/firebase.dart';

class StoryAddView extends StatelessWidget {
  String? storyPic;
   StoryAddView({ this.storyPic});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [

                  Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(15)
              ),
                    width: 390,
                    height: 550,
                    child: Image(image: NetworkImage(storyPic.toString()),fit: BoxFit.cover,),
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 20,
                        child: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 110,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 20,
                      child: Icon(Icons.person_pin_outlined,color: Colors.white,),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 160,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 20,
                      child: Icon(Icons.sort_by_alpha,color: Colors.white,),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 210,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 20,
                      child: Icon(Icons.insert_emoticon,color: Colors.white,),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 260,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 20,
                      child: Icon(Icons.auto_awesome,color: Colors.white,),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 310,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 20,
                      child: Icon(Icons.more_horiz,color: Colors.white,),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.yellow,
                            ),
                            Text('Your story')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 7,),
                    Container(
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          color: Colors.grey),
                      child:  Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 13,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.green,
                                child: Icon(Icons.star_outlined,color: Colors.white,size: 12,),
                              ),
                            ),
                            Text(' Close Friends')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 7,),
                    GestureDetector(
                      onTap: () async {
                        var storypostx =StoryModel(userId: currentUserId,
                            userName: usersmodel!.userName,
                            viewers:[],
                            likesList: [],
                            storyUrl: storyPic,
                            uploadedTime:DateTime.now());
                        storypost=storypostx;

                        FirebaseFirestore.instance
                            .collection(Firebaseconstant.user)
                            .doc(currentUserId)
                            .collection('story')
                            .add(storypostx.toJson()).then((value) async {
                          var data =await value.get();
                          var ref = data.reference;
                          var a=storypostx?.copyWith(
                              storyRef: ref,
                              storyid: value.id,
                          );

                          print('ref=$ref');
                          await  ref.update(a!.toJson());
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(" successful")));
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.east,color: Colors.black,),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
