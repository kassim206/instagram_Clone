import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task3/unfiles/utils.dart';
class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? file;
  selectImage(BuildContext context)async{
    return showDialog(context: context, builder: (context){
      return SimpleDialog(
        title: const Text('Creat a Post'),
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Take a Photo'),
            onPressed: ()async{
              Navigator.of(context).pop();
              Uint8List file =await PickImage(ImageSource.camera,);
              setState(() {
                file =file;
              });
            }
          ),
          SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Choose from gallery'),
              onPressed: ()async{
                Navigator.of(context).pop();
                Uint8List file =await PickImage(ImageSource.gallery,);
                setState(() {
                  file =file;
                });
              }
          ),
        ],
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return file == null? Center(
        child: IconButton(onPressed: () => selectImage(context),
            icon: Icon(Icons.upload)
        ),
    ):
     Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(onPressed: (){},
            icon: Icon(Icons.arrow_back_ios)),
        title:const Text('Post'),
        centerTitle: false,
        actions: [
          TextButton(onPressed: (){}, child: Text('Post',style: TextStyle(
            color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 16,
          ),))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://media.istockphoto.com/id/1146517111/photo/taj-mahal-mausoleum-in-agra.jpg?s=612x612&w=0&k=20&c=vcIjhwUrNyjoKbGbAQ5sOcEzDUgOfCsm9ySmJ8gNeRk='),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.45,
                child: TextFormField(
                  decoration:const InputDecoration(
                    hintText: 'write a caption...',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                  width: 45,
                child: AspectRatio(
                  aspectRatio: 487/451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                          fit: BoxFit.cover,
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
            ],
          )
        ],
      ),
    );
  }
}
