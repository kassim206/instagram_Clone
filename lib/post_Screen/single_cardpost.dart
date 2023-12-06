import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task3/Auth/Authentication.dart';
import 'package:task3/model/MediaModels.dart';
import 'package:task3/post_Screen/like_animation.dart';

import '../comments/comments_screen.dart';
import '../home_Screen/home.dart';
import '../model/accountmodels.dart';
class SinglePost extends StatefulWidget {
  MediaModel post ;
   SinglePost({super.key,required this.post,});

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  bool isLikeAnimating =false;
  lcheck(){
    if(widget.post.likesList!.contains(currentUserId)){
      likescheck =true;
    }else{
      likescheck=false;
    }
  }
  bool likescheck=false;
  @override
  void initState() {
    // TODO: implement initState

    // print(currentuser!.userName);
    // print(currentuser!.imageUrl);
    super.initState();
    lcheck();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
              .copyWith(right: 0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKgPHAbjutEgMs1t5hhbqtbhTYlJJHJ0UNurgqDPSdl9BYnmuEjLt5hVr91f8Q9r9IGpM&usqp=CAU",),
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post.userName.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: ListView(
                            padding:
                            const EdgeInsets.symmetric(vertical: 16),
                            shrinkWrap: true,
                            children: [
                              'Delete',
                            ]
                                .map((e) => InkWell(
                              child: GestureDetector(
                                onTap: (){
                                  widget.post.postRef!.delete();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  child: Text(e),
                                ),
                              ),
                            ))
                                .toList()),
                      ),
                    );
                  },
                  icon: const Icon(Icons.more_vert))
            ],
          ),
        ),
        GestureDetector(
          onDoubleTap: (){
          setState(() {
            isLikeAnimating =true;
          });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
              height: h * 0.35,
              width: double.infinity,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.post.postUrl.toString(),
              ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isLikeAnimating? 1:0,
                child: LikeAnimation(
                  chiled: const Icon(Icons.favorite,
                  color: Colors.pink,size: 100,),
                    isAnimating: isLikeAnimating,
                  duration: const Duration(
                    milliseconds: 400,
                  ),
                  onEnd: (){
                  setState(() {
                    isLikeAnimating =false;
                  });
                  },
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () async {
                  setState(() {
                    if(widget.post.likesList!.contains(currentUserId))
                    {
                      widget.post.likesList!.remove(currentUserId);
                      likescheck=false;

                    }
                    else{
                      widget.post.likesList!.add(currentUserId);
                      likescheck=true;
                    }
                  });
                  var a = widget.post.copyWith(likesList: widget.post.likesList);
                await  widget.post.postRef!.update(a.toJson());

                },
                icon:likescheck?  Icon(
                  Icons.favorite,
                  color: Colors.red,
                ):Icon(Icons.favorite_outline)),
            IconButton(
                onPressed: () {
                 showModalBottomSheet(context: context, builder: (context){
                   return CommentDisplay(post: widget.post);
                 }
                  );
                },
                icon: const Icon(
                  Icons.comment_outlined,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send  ,
                )),
            Expanded(child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border))
            ))
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 16
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${widget.post.likesList!.length} likes',style: Theme.of(context).textTheme.bodyMedium,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    top: 8
                ),
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'username',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        TextSpan(
                            text: ' Hey guys description'
                        )
                      ]
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text('View all 100 comments',
                    style:TextStyle(fontSize: 13,color: Colors.grey) ,),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text('9/08/2023',
                  style:TextStyle(fontSize: 13,color: Colors.grey) ,),
              ),
            ],
          ),
        )
      ],
    );
  }
}
