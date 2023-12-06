
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task3/Auth/Authentication.dart';
import 'package:task3/Stream/firebase.dart';
import 'package:task3/home_Screen/home.dart';
import 'package:task3/model/MediaModels.dart';
import 'package:task3/model/accountmodels.dart';
import 'package:task3/model/comment_models.dart';
class CommentDisplay extends StatefulWidget {

  MediaModel? post;
   CommentDisplay({
     required this.post
   });
  @override
  State<CommentDisplay> createState() => _CommentDisplayState();
}
class _CommentDisplayState extends State<CommentDisplay> {
  Stream <List<CommentModel>> commentStream(){
   return  widget.post!.postRef!
       .collection(Firebaseconstant.comment)
       .snapshots()
       .map((event) => event
       .docs.map((e) => CommentModel.fromJson(e.data())).toList());
  }
  TextEditingController controller = TextEditingController();
  
  List email=["shaashahim@gmail.com","ekshanid5@gmail.com"];
datacom()
 {
// async {
//  await FirebaseFirestore.instance.collection("users").doc('t5tzVtI5CKfYEoFawQAdV7FsPzL2').set({
//    'Text':'kassim'
//  });//   print(value.docs[1].data()['email']);

  FirebaseFirestore.instance.collection('users').where('email',whereIn: email )
    .get().then((value) {
      print(value.docs.map((e) => e.data()['email']));

 });

}

  addComment(){
    var commentToFirebase = CommentModel(
        commentOwnerId: currentUserId,
        commentContent: controller.text ,
        commentedTime: DateTime.now(),
        commentOwnerName: usersmodel!.userName,
        commentOwnerDp: usersmodel!.imageUrl
    );
    comment = commentToFirebase;

       widget.post!.postRef!
           .collection(Firebaseconstant.comment)
           .add(commentToFirebase.toJson()).then((value) async {
         var commentRef = await value.get();
         var data = comment!.CopyWith(
           commentRef:commentRef.reference,
           commentId: value.id
         );
         commentRef.reference.update(data.toJson());
       }
       );
  }

  @override
  void initState() {
    datacom();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text('comment',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            Container(
              width: double.infinity,
              color: Colors.white,
              height: h*.39,
             child: StreamBuilder<List<CommentModel>>(
               stream: commentStream(),
               builder: (context, snapshot) {
                 if (snapshot.hasData) {
                   List<CommentModel>? data = snapshot.data;
                   return ListView.builder(
                     itemCount: data!.length,
                     itemBuilder: (BuildContext context, int index) {
                       return ListTile(
                         leading: ClipRRect(
                           borderRadius: BorderRadius.circular(16),
                           child: Image(image: NetworkImage(
                             data[index].commentOwnerDp.toString(),),
                             width: 50,
                             height: 50,
                             fit: BoxFit.cover,),
                         ),
                         title: Text(data![index].commentContent.toString()),
                         trailing: Row(
                           children: [
                             Icon(Icons.favorite, color: Colors.pink,),
                             GestureDetector(
                               onTap: (){
                               },
                                 child: Icon(Icons.more_vert)),
                           ],
                         ),
                       );
                     },
                   );
                 }
                 else{
                 return  Center(child: CircularProgressIndicator());
                 }
               } ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://media.istockphoto.com/id/1146517111/photo/taj-mahal-mausoleum-in-agra.jpg?s=612x612&w=0&k=20&c=vcIjhwUrNyjoKbGbAQ5sOcEzDUgOfCsm9ySmJ8gNeRk='),
               radius: 25,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.45,
                  child: TextFormField(
                    controller: controller,
                    decoration:const InputDecoration(
                      hintText: 'Add a comment for....',
                      border: InputBorder.none,
                    ),
                    maxLines: 3,
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: AspectRatio(
                    aspectRatio: 487/451,
                    child: GestureDetector(
                      onTap: (){
                        addComment();
                      },
                      child: Container(child:
                      Center(child: Text('Post',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),))),
                    )
                  ),
                ),

              ],
            )
          ],

        ),
      ),
    );
  }
}
