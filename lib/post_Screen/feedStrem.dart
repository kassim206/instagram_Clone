import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task3/model/MediaModels.dart';
import 'package:task3/post_Screen/single_cardpost.dart';
import '../Stories/story.dart';
import '../Stories/storyp2.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Stream<List<MediaModel>> user1() {
    return FirebaseFirestore.instance
        .collectionGroup('posts')
        .orderBy('uploadedTime',descending: true).snapshots()
        .map(
        (event) =>
            event.docs.map((e) => MediaModel.fromJson(e.data())).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => StoryUploud(),));
          },
          child: Icon(
            Icons.camera_alt,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
            "THRIFTY",
            style: GoogleFonts.aladin(color: Colors.black, fontSize: 18),
          ),
        ),
        actions: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle_outline_sharp,
                    color: Colors.black,
                  ),
                  Icon(
                    Icons.favorite_outlined,
                    color: Colors.black,
                  ),
                  Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                ],
              ),
            ),

          )
        ],
      ),
      body: Column(
        children: [
          Container(height: 65,
              child: StoryHome()),
          Expanded(
            child: StreamBuilder(
              stream: user1(),
              builder: (context, snapshot) {
                print(snapshot.error);
                print(snapshot.error);
                List<MediaModel>? posts =snapshot.data;
                print(posts);
                if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: posts?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SinglePost(post: posts![index],);
                      });
                }
                else{
                  return Center(child: CircularProgressIndicator());
                }



              }
            ),
          ),
        ],
      ),
    );
  }
}
