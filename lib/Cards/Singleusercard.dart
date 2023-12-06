import 'package:flutter/material.dart';
import 'package:task3/Auth/Authentication.dart';

import '../model/accountmodels.dart';

class Usercard extends StatefulWidget {
  int index;
  UsersModel? data;

  Usercard({
    required this.data,
    required this.index,
  });

  @override
  State<Usercard> createState() => _UsercardState();
}

class _UsercardState extends State<Usercard> {
  bool Following = false;
  @override
  void initState() {
    widget.data!.followers!.contains(currentUserId)
        ? Following = true
        : Following = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${widget.index + 1}"),
            CircleAvatar(
              backgroundImage: NetworkImage(widget.data!.imageUrl.toString()),
            ),
          ],
        ),
        title: Text(widget.data!.userName.toString()),
        subtitle: Text(widget.data!.userEmail.toString()),
        trailing: TextButton(
          onPressed: () {
            setState(() {
              widget.data!.followers!.contains(currentUserId)
                  ? widget.data!.followers!.remove(currentUserId)
                  : widget.data!.followers!.add(currentUserId);
              Following == true ? Following = false : Following = true;
              var UpdateFollow =
                  widget.data!.copyWith(followers: widget.data!.followers);
              widget.data!.ref!.update(UpdateFollow.toJson());
            });
            // Navigator.push(context,
            // MaterialPageRoute(builder:(context) => user()));
          },
          child: Text(
            Following ? "unfollow" : "Follow",
            style: TextStyle(color: Colors.blueGrey),
          ),
        ),
      ),
    );
  }
}
