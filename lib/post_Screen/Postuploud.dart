import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task3/model/MediaModels.dart';
import 'package:task3/post_Screen/PostPage.dart';
import 'package:task3/home_Screen/home.dart';

import '../Auth/Authentication.dart';
import '../model/accountmodels.dart';
import '../Stream/firebase.dart';
class PostUploding extends StatefulWidget {
  const PostUploding({super.key});

  @override
  State<PostUploding> createState() => _PostUplodingState();
}

class _PostUplodingState extends State<PostUploding> {

  TextEditingController text=TextEditingController();
  var addpost;
  update({required ImageSource media}) async {

    ImagePicker imagePicker=ImagePicker();
    XFile? file=await imagePicker.pickImage(source: media);
    var ref=FirebaseStorage.instance.ref().child("kassim/image-${DateTime.now()}");
    UploadTask uploadTask =ref.putFile(File(file!.path));
    uploadTask.then((p0) async =>
    addpost= (await ref.getDownloadURL()).toString()).then((value) {
      print(addpost);
      setState(() {

      });

    });
    // var image=await ref.getDownloadURL();
    // print("====================================================$image");



  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 20,
            child: Container(
              width: w*.900,
              height: h*.450,
              decoration: BoxDecoration(
                color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(addpost??""),fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: 330,
            left: 55,
            child: Container(
              width: w*.230,
              height: h*.100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              // child: Image(image: NetworkImage("https://icons.iconarchive.com/icons/iconarchive/outline-camera/512/Flat-Red-Big-Camera-icon.png"),),
                child: GestureDetector(
                    onTap: (){
                      update(media: ImageSource.camera);
                    },
                    child:  Image(image: NetworkImage("https://icons.iconarchive.com/icons/iconarchive/outline-camera/512/Flat-Red-Big-Camera-icon.png"),)),
            ),
          ),
          Positioned(
            top: 330,
            left: 200,
            child: Container(
              width: w*.250,
              height: h*.100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: GestureDetector(
                  onTap: (){
                    update(media: ImageSource.gallery);
                  },
                  child:  Image(image: NetworkImage("https://icon-library.com/images/gallery-icon/gallery-icon-17.jpg"),)),
              // child: Image(image: NetworkImage("https://icon-library.com/images/gallery-icon/gallery-icon-17.jpg"),),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 20,
            child: Container(
              width: w*.900,
              height: h*.140,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Description",style: TextStyle(color: Colors.black),),
                    TextFormField(
                      controller: text,
                    )
                  ],
                ),
              ),

            ),
          ),
          Positioned(
            bottom: 5,
            left: 150,
            child: InkWell(
              onTap: (){
                var post=MediaModel(userId: currentUserId,
                    userName:currentuser!.userName,
                    postDescription:text.text,
                    likesList:[],
                    postUrl: addpost,
                    uploadedTime:DateTime.now());
              },
              child: Container(
                width: w*.250,
                height: h*.100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: InkWell(onTap:
                  () async {
                 var p =MediaModel(userId: currentUserId,

                     userName: usersmodel!.userName,
                     postDescription: text.text,
                     likesList:[],
                     postUrl: addpost,
                     uploadedTime: DateTime.now());
                 mediapost =p;
                 await  FirebaseFirestore.instance
                     .collection(Firebaseconstant.user)
                     .doc(currentUserId)
                     .collection('posts')
                     .add(p.toJson()).then((value) async {
                   var data =await value.get();
                   var ref = data.reference;
                   var a=mediapost?.copyWith(
                       postId: value.id,
                       postRef: ref
                   );

                   print('ref=$ref');
                   await  ref.update(a!.toJson());
                 });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(" successfully uploaded")));

                  },
                    child: Center(child: Text("upload post",style: TextStyle(color: Colors.black),))),
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}
