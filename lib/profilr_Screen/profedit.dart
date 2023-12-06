import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task3/Auth/Authentication.dart';
import 'package:task3/unfiles/datas.dart';
import 'package:task3/Stream/firebase.dart';
import 'package:task3/unfiles/util.dart';
import '../model/accountmodels.dart';
import '../model/accountmodels.dart';
import '../home_Screen/home.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  // Uint8List? _image;
  // void SelectedImage() async {
  //   Uint8List img = await PickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = img;
  //   });
  // }

  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  Authentication obj = Authentication();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController editphonecontroller = TextEditingController();

  getdata() async {
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.user)
        .doc(currentUserId)
        .snapshots()
        .listen((event) {
      if (event.data() != null) {
        usersmodel = UsersModel.fromJson(event.data()!);
        print(usersmodel?.userName.toString());
      }
    });
  }
  update({required ImageSource media}) async {
    var url;
    ImagePicker imagePicker=ImagePicker();
  XFile? file=await imagePicker.pickImage(source: media);
  var ref=FirebaseStorage.instance.ref().child("kassim/image-${DateTime.now()}");
  UploadTask uploadTask =ref.putFile(File(file!.path));
  uploadTask.then((p0) async =>
  url= (await ref.getDownloadURL()).toString()).then((value) {
    var a=usersmodel?.copyWith(
        imageUrl: url
    );
    FirebaseFirestore.instance.collection(Firebaseconstant.user).doc(currentUserId).update(
        a!.toJson()
    );
  });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


      getdata();

    print(usersmodel!.userName.toString());
    usernamecontroller =
        TextEditingController(text: usersmodel!.userName.toString());
    editphonecontroller =
        TextEditingController(text: usersmodel!.userPhoneNumber.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leading: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Text("Cancel",style: TextStyle(color: Colors.black,fontSize: 10),),
      //   ),
      //   title: Center(child: Text("Edit Profile",style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),)),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text("Done",style: TextStyle(color: Colors.black),),
      //     )
      //   ],
      // ),
      body: Center(
        child: Container(
          width: w * .900,
          height: h * .700,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 120,
                  width: w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Center(
                            child: Text(
                          "Edit Profile",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(
                          width: 60,
                        ),
                        GestureDetector(
                            // onTap: () async {
                            // final val=formKey.currentState!.validate();
                            // if(val) {
                            //   usersmodel=(await obj.UsersModel(FirebaseAuth.instance.currentUser!.uid));
                            //   var updateData=usersmodel!.copyWith(userName: usernamecontroller.text, userPhoneNumber: editphonecontroller.text);
                            //   FirebaseFirestore.instance.collection(FirebaseConstants.user).doc(FirebaseAuth.instance.currentUser!.uid).update(
                            //       updateData.toJson());
                            //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyApp6(),), (route) => false);
                            //
                            // }},

                            onTap: () {
                              var a = usersmodel?.copyWith(
                                userPhoneNumber: editphonecontroller.text,
                                userName: usernamecontroller.text,
                              );
                              FirebaseFirestore.instance
                                  .collection(FirebaseConstants.user)
                                  .doc(currentUserId)
                                  .update(a!.toJson());
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Done",
                              style: TextStyle(color: Colors.black),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      // _image != null
                      //     ? CircleAvatar(
                      //         radius: 50.0,
                      //         backgroundImage: MemoryImage(_image!),
                      //       )
                           CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                                  NetworkImage(usersmodel!.imageUrl.toString()),
                              backgroundColor: Colors.transparent,
                            ),
                      Positioned(
                        child: IconButton(
                          onPressed: (){
                           setState(() {
                             update(media: ImageSource.gallery);
                           });
                            Navigator.pop(context);

                          },
                          icon: Icon(Icons.add_a_photo),
                        ),
                        top: 30,
                        left: 100,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: usernamecontroller,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: editphonecontroller,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
