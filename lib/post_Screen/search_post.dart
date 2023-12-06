import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Stream/firebase.dart';
import '../home_Screen/home.dart';
import '../model/MediaModels.dart';

class SearchPost extends StatefulWidget {
  MediaModel? post;
  SearchPost({
    super.key,
    this.post,
  });

  @override
  State<SearchPost> createState() => _SearchPostState();
}

class _SearchPostState extends State<SearchPost> {
  Stream<List<MediaModel>> post() {
    return FirebaseFirestore.instance
        .collectionGroup(Firebaseconstant.user)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => MediaModel.fromJson(e.data())).toList());
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            width: double.infinity,
            height: h * 0.065,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.search, color: Colors.black, size: 30),
                    suffixIcon: Icon(
                      Icons.drag_handle,
                    ),
                    hintText: 'Search',
                    filled: true,
                    fillColor: Color.fromRGBO(245, 245, 245, 1),
                    border: InputBorder.none),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: post(),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  print(snapshot.error);
                  if (snapshot.hasData) {
                    List<MediaModel>? post = snapshot.data;
                    print(post);
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, mainAxisSpacing: 2),
                        itemCount: post!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            width: 50,
                            color: Colors.yellow,
                            child: SizedBox(
                              height: h * 0.35,
                              width: double.infinity,
                              // child: CachedNetworkImage(
                              //   fit: BoxFit.cover,
                              //    imageUrl: widget.post.p,
                              // ),
                              child: Text(widget.post!.userName.toString()),
                            ),
                            // child: Image(image: NetworkImage(url),),
                          );
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        ],
      ),
    ));
  }
}
