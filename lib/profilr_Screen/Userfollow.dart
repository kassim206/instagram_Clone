import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task3/Auth/Authentication.dart';
import '../model/accountmodels.dart';
import '../Stream/firebase.dart';

class Followers extends StatefulWidget {
  const Followers({Key? key}) : super(key: key);

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  Stream user() {
  return FirebaseFirestore.instance
      .collection(Firebaseconstant.user).where("followers",arrayContains: currentUserId)
      .snapshots()
      .map((event) => event.docs.map((e) => UsersModel.fromJson(e.data())).toList());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('Following',style: TextStyle(color: Colors.black),),
              iconTheme: IconThemeData(color: Colors.black45),
              elevation: 0,
            ),
            body: StreamBuilder(
                stream: user(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<UsersModel> followers = snapshot.data;
                    print(followers.length);
                    // List<UsersModel> followers = [];
                    // for (var i in data) {
                    //   print(i);
                    //
                    // }

                    return ListView.builder(

                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: ListTile(
                                leading: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("${index + 1}"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(followers[index].imageUrl.toString()),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  followers[index].userName.toString(),
                                ),
                                subtitle:
                                Text(followers[index].userEmail.toString()),
                              ));
                        },
                        itemCount: followers.length);
                  } else {
                    return
                      CircularProgressIndicator(color:
                      Colors.black45,);
                  }
                })));
  }
}











