
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import '../Auth/Authentication.dart';
import '../Stream/firebase.dart';
import '../model/story_model.dart';

class StoryViewPage extends StatefulWidget {
  StoryModel? data;

   StoryViewPage({super.key,required this.data});

  @override
  State<StoryViewPage> createState() => _StoryViewState();
}
class _StoryViewState extends State<StoryViewPage> {
  final storyController = StoryController();

  @override
  void dispose() {
    super.dispose();
    storyController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Stream str() {
      return  FirebaseFirestore.instance.collection(Firebaseconstant.user).doc(currentUserId).collection('story')
          .snapshots().map((event) => event.docs.map((e) => StoryModel.fromJson(e.data())).toList());
    }
    double percent=0.0;
    late Timer _timer;
    void startTimer(){
      _timer =Timer.periodic(Duration(milliseconds: 5), (timer) {
        setState(() {
          percent+=0.001;
          if(percent >1){
            _timer.cancel();
            Navigator.pop(context);
          }
        });
      });
    }
    @override
    void initState() {
      // TODO: implement initState
      startTimer();
      super.initState();
    }
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              StoryView(
                controller: storyController,
                storyItems: [


                  // int i = widget.index because we want to load the story just after the clicked item

                    StoryItem.inlineImage(
                      imageFit: BoxFit.contain,
                      url: (widget.data!.storyUrl.toString()),
                      controller: storyController,
                      caption: const Text(
                        "Caption Here",
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.black54,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  StoryItem.inlineImage(
                    imageFit: BoxFit.contain,
                    url: ('https://img.freepik.com/premium-photo/colorful-splash-liquid-is-shown-with-colorful-background_865967-156034.jpg'),
                    controller: storyController,
                    caption: const Text(
                      "Caption Here",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    imageFit: BoxFit.contain,
                    url: ('https://media.tenor.com/eBWplvjY4RUAAAAM/mi.gif'),
                    controller: storyController,
                    caption: const Text(
                      "Caption Here",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.pageVideo(
                    imageFit: BoxFit.cover,
                      'https://cdn.pixabay.com/vimeo/429661458/magic-42197.mp4?width=1280&hash=c03bcc2d423701b0cecc50696a7bd64a16fb6096',
                      controller:storyController ),
                  StoryItem.pageVideo('https://cdn.pixabay.com/vimeo/388172974/design-31718.mp4?width=1280&hash=1af392f78e87d55a1f708398f78f58fc1a262975',
                      controller:storyController )

                ],
                onStoryShow: (s) {

                },
                onComplete: () {
                },
                progressPosition: ProgressPosition.top,
                repeat: false,
                inline: true,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child:const Icon(
                    Icons.cancel,
                    color: Colors.grey,
                    size: 40,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
