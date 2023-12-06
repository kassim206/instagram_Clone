
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
UsersModel? currentuser;


UsersModel? usersmodel;
class UsersModel {
  String? userName;
  String? userEmail;
  String? userPhoneNumber;
  String? userPassword;
  String? imageUrl;
  String? uid;
  List? followers;
  DocumentReference? ref;
  DateTime? createDate;
  DateTime? lastLogged;

  UsersModel(
      {required this.userEmail,
        required this.userName,
        required this.userPhoneNumber,
        required this.userPassword,
         required this.imageUrl,
        required this.followers,
        this.ref,
        required this.createDate,
        required this.lastLogged,
        required this.uid,

  });
  UsersModel.fromJson(Map<String,dynamic>Json){
    followers=Json['followers']??[];
    userName=Json["userName"]??'';
    userEmail=Json["email"]??'';
    userPhoneNumber=Json["phoneNo"]??'';
    userPassword=Json["password"]??'';
    imageUrl=Json["dp"]??'';
    uid=Json['uid']??'';
    ref=Json['ref'];
    lastLogged=Json["lastLogged"]==null?DateTime.now():Json["lastLogged"].toDate();
    createDate=Json["createDate"]==null?DateTime.now():Json["createDate"].toDate();

  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic>data=<String,dynamic>{};
    data['userName']=userName;
    data['email']=userEmail;
    data['createDate']=createDate;
    data['phoneNo']=userPhoneNumber;
    data['password']=userPassword;
    data['dp']=imageUrl;
    data['followers']=followers;
    data['ref']=ref;
    data['createDate']=createDate;
    data['lastLogged']=lastLogged;
    data['uid']=uid;
    return data;
  }
   UsersModel copyWith({
     String? userName,
     String? userEmail,
     String? userPhoneNumber,
     String? userPassword,
     String? imageUrl,
     List? followers,
     String? uid,
     DocumentReference? ref,
     DateTime? createDate,
     DateTime? lastLogged,

})
   {
     return UsersModel(
         userEmail: userEmail??this.userEmail,
         userName: userName??this.userName,
         userPhoneNumber:userPhoneNumber??this.userPhoneNumber,
         userPassword: userPassword??this.userPassword,
         imageUrl: imageUrl??this.imageUrl,
         uid: uid??this.uid,
         ref: ref??this.ref,
         createDate: createDate??this.createDate,
         lastLogged: lastLogged??this.lastLogged,
         followers:followers??this.followers,);
   }
}