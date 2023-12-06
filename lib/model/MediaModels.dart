import 'package:cloud_firestore/cloud_firestore.dart';
MediaModel? mediapost;
 class MediaModel{
   String? userId;
   String? userName;
   String? postDescription;
   String? postId;
   List? likesList;
   DateTime? uploadedTime;
   String? postUrl;
   DocumentReference? postRef;
   MediaModel(
   {
     required this.userId,
     required this. userName,
     required this.postDescription,
     required this.likesList,
     required this.postUrl,
     required this.uploadedTime,
      this.postId,
      this.postRef,
 });
   Map<String,dynamic>toJson(){
     final Map<String, dynamic> data = <String, dynamic>{};
     data["userName"] = userName;
     data["userId"] = userId;
     data["postId"] = postId;
     data["likes"] = likesList;
     data["postUrl"] = postUrl;
     data["ref"] = postRef;
     data["uploadedTime"] = uploadedTime;
     data["description"] = postDescription;

     return data;
   }
   MediaModel.fromJson(Map<String, dynamic> json) {
     userName = json["userName"] ?? '';
     userId = json["userid"] ?? '';
     postId = json["postId"] ?? '';
     likesList = json["likes"] ?? [];
     postRef = json["ref"]??null;
     postDescription = json["description"] ?? '';
     uploadedTime = json["uploadedTime"] == null
         ? DateTime.now()
         : json["uploadedTime"].toDate();
     postUrl = json["postUrl"] ?? "";

   }
   MediaModel copyWith({
     String? userId,
     String? userName,
     String? postDescription,
     List? likesList,
     DateTime? uploadedTime,
     String? postUrl,
     String? postId,
     DocumentReference? postRef,
   }
 )
   {
     return MediaModel(
         userId:userId??this.userId,
         userName:userName??this.userName,
         postDescription: postDescription??this.postDescription,
         likesList: likesList??this.likesList,
         postUrl: postUrl??this.postUrl,
         postRef:postRef??this.postRef,
         postId:postId??this.postId,
         uploadedTime: uploadedTime??this.uploadedTime);

   }
 }