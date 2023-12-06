import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../home_Screen/home.dart';
import 'firebase.dart';
import '../model/MediaModels.dart';

class GridPage_post extends StatefulWidget {
  const GridPage_post({super.key});

  @override
  State<GridPage_post> createState() => _GridPage_postState();
}

class _GridPage_postState extends State<GridPage_post> {
  Stream post() {
    return FirebaseFirestore.instance
        .collection(Firebaseconstant.user)
        .doc('t5tzVtI5CKfYEoFawQAdV7FsPzL2')
        .collection('posts')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => MediaModel.fromJson(e.data())).toList());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: post(),
        builder: (context, snapshot) {
          print(snapshot.error);
          if (snapshot.hasData) {
            print(snapshot.data);
            List<MediaModel> media = snapshot.data;
            print(media);
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 2),
                itemCount: media.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                     showDialog(context: context, builder:(context) {
                       return AlertDialog(
                         content: Column(
                           children: [
                             InteractiveViewer(
                               child:  CachedNetworkImage(
                                   imageUrl: media[index].postUrl!,
                                   fit: BoxFit.cover


                               ),
                             ),
                             Row(
                               children: [
                                 Icon( Icons.favorite_outlined,color: Colors.red, ),
                                 Icon(  Icons.chat_bubble_outline,  ),
                                 Icon( Icons.share, )
                               ],
                             )
                           ],
                         ),
                       );
                     },);
                    },
                    child: Container(
                      height: h * 0.02,
                      color: Colors.transparent,
                           child: CachedNetworkImage(
                             imageUrl: media[index].postUrl!,
                             fit: BoxFit.cover


                           ),
                    ),
                  );

                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
