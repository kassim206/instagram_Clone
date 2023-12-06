import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task3/Auth/Authentication.dart';
import 'package:task3/Stream/firebase.dart';
import 'package:task3/model/accountmodels.dart';
import 'package:task3/model/story_model.dart';
class StoryUploud extends StatefulWidget {
  const StoryUploud({super.key});

  @override
  State<StoryUploud> createState() => _StoryUploudState();
}

class _StoryUploudState extends State<StoryUploud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: Text('add'),
          style: ElevatedButton.styleFrom(
           backgroundColor: Colors.green
          ),
          onPressed: () {
            var storypost =StoryModel(userId: currentUserId,
                userName: usersmodel!.userName,
                viewers:[],
                likesList: [],
                storyUrl: '',
                uploadedTime:DateTime.now());
            FirebaseFirestore.instance
                .collection(Firebaseconstant.user)
                .doc(currentUserId)
                .collection('story')
                .add(storypost.toJson()).then((value) async {
              var data =await value.get();
              var ref = data.reference;
              var a=storypost?.copyWith(
                  storyRef: ref
              );

              print('ref=$ref');
              await  ref.update(a!.toJson());
            });
          },
        ),
      ),
    );
  }
}
