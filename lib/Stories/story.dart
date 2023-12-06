import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task3/Stories/storyaddview.dart';
import 'package:task3/model/story_model.dart';

import '../model/accountmodels.dart';
import 'expstr.dart';
class StoryHome extends StatefulWidget {
  const StoryHome({super.key});

  @override
  State<StoryHome> createState() => _StoryHomeState();
}

class _StoryHomeState extends State<StoryHome> {
  var addstory;
  update({required ImageSource media}) async {

    ImagePicker imagePicker=ImagePicker();
    XFile? file=await imagePicker.pickImage(source: media);
    var ref=FirebaseStorage.instance.ref().child("kassim/image-${DateTime.now()}");
    UploadTask uploadTask =ref.putFile(File(file!.path));
    uploadTask.then((p0) async =>
    addstory= (await ref.getDownloadURL()).toString()).then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => StoryAddView(storyPic: addstory),));
      print(addstory);
      setState(() {
      });
    });
    // var image=await ref.getDownloadURL();
    // print("====================================================$image");



  }
  Stream story() {
    return FirebaseFirestore.instance
        .collectionGroup('story')
        .orderBy('uploadedTime',descending: true).snapshots()
        .map(
            (event) =>
            event.docs.map((e) => StoryModel.fromJson(e.data())).toList());
  }
  @override
  Widget build(BuildContext context) {
    return
      StreamBuilder(
        stream: story(),
        builder: (context, snapshot) {
          List<StoryModel>? sty =snapshot.data;
          // print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
          print(snapshot.error);
          if(snapshot.hasData){
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sty?.length,
                itemBuilder: (BuildContext context, int index){
                  if(index==0){
                   return Padding(
                     padding: const EdgeInsets.symmetric(vertical: 0.5,horizontal: 3),
                     child: Column(
                        children: [
                          DottedBorder(
                            borderType: BorderType.Circle,
                            color: Colors.pink,
                            strokeWidth: 2,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => StoryViewPage(data: storypost,)));
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 30.0,
                         backgroundImage: NetworkImage(usersmodel!.imageUrl.toString()),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        bottom: 3,
                                        right: 5,
                                        child: GestureDetector(
                                          onTap: (){
                                            update(media: ImageSource.gallery);
                                          },
                                            child: Icon(Icons.add_circle,color: Colors.blueAccent,)))
                                  ],
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                   );
                  }
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: DottedBorder(
                        borderType: BorderType.Circle,
                        color: Colors.pink,
                        strokeWidth: 2,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => StoryViewPage(data: sty![index],)));
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2020/12/12/17/24/little-egret-5826070_640.jpg'),
                           
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
          else{
            return Center(child: CircularProgressIndicator());
          }

        }
      );
  }
}
