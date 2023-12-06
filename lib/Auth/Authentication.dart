import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/model/accountmodels.dart';
import 'package:task3/unfiles/datas.dart';
import 'package:task3/register/login.dart';

import '../home_Screen/home.dart';

var currentUserId;
final GoogleSignIn googleSignIn = GoogleSignIn();

class Authentication {
  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(authCredential);
      User? user = result.user;
      currentUserId = user!.uid;

      if (result.additionalUserInfo!.isNewUser) {
        var a = UsersModel(
            userEmail: user?.email,
            userName: user?.displayName,
            userPhoneNumber: user.phoneNumber ?? "",
            userPassword: "",
            imageUrl: user?.photoURL ?? '',
            uid: currentUserId,
            createDate: DateTime.now(),
            lastLogged: DateTime.now(),
            followers: []);
        FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .set(
              a.toJson(),
            )
            .then((value) async {
          var data = await FirebaseFirestore.instance
              .collection(FirebaseConstants.user)
              .doc(currentUserId)
              .get();
          usersmodel = (await (getUser(user.uid)))!;
          var c = usersmodel!.copyWith(ref: data.reference);
          FirebaseFirestore.instance
              .collection(FirebaseConstants.user)
              .doc(currentUserId)
              .update(c.toJson());
        });
        usersmodel = await getUser(user!.uid);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogged', true);
        prefs.setString('userUid', user.uid);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp6()));
      } else {
        usersmodel = await getUser(user!.uid);
        var c = usersmodel?.copyWith(lastLogged: DateTime.now());
        FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserId)
            .update(c!.toJson())
            .onError((error, stackTrace) => print("45edytfuyfvjuv$error"));
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogged', true);
        prefs.setString('userUid', user.uid);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp6()));
      }
    }
    // for go to the HomePage screen
  }

  signout(BuildContext context) {
    GoogleSignIn().signOut();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => loginpage()), (route) => false);
  }
}

getUser(String userId) async {
  DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('users')
      .doc(currentUserId)
      .get();

  if (snapshot.exists) {
    print("userExits");
    final data = UsersModel.fromJson(snapshot.data()!);

    return data;
  }
}
