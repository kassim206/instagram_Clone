import 'package:cloud_firestore/cloud_firestore.dart';


CommentModel? comment;

class CommentModel {
  String? commentId;
  String? commentOwnerId;
  String? commentContent;
  String? commentOwnerDp;
  String? commentOwnerName;
  DateTime? commentedTime;
  DocumentReference? commentRef;
  CommentModel
      (
      {
    this.commentId,
    required this.commentOwnerId,
    required this.commentContent,
    required this.commentedTime,
    required this.commentOwnerName,
    required this.commentOwnerDp,
    this.commentRef,
  });
  Map<String,dynamic>toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["commentId"] =commentId ;
    data["createdTime"] = commentedTime ;
    data["commentContent"] =commentContent ;
    data["commentRef"] =commentRef ;
    data["commentOwnerId"] =commentOwnerId ;
    data["commentOwnerName"] =commentOwnerName ;
    data["commentOwnerDp"] =commentOwnerDp ;


    return data;
  }
  CommentModel.fromJson(Map<String, dynamic> json){
    commentId =json['commentId']??'';
    commentedTime = json["commentedTime"] == null
        ? DateTime.now()
        : json["commentedTime"].toDate();
    commentContent = json['commentContent']??'';
    commentOwnerDp = json['commentOwnerDp']??'';
    commentOwnerName = json['commentOwnerName']??'';
    commentRef = json['commentRef']??'';
    commentOwnerId = json['commentOwnerId']??'';
  }
  CommentModel CopyWith(
  {
    String? commentId,
    String? commentOwnerId,
    String? commentContent,
    String? commentOwnerDp,
    String? commentOwnerName,
    DateTime? commentedTime,
    DocumentReference? commentRef,

})
  {
       return CommentModel(
           commentOwnerId: commentOwnerId?? this.commentOwnerId,
           commentContent: commentContent?? this.commentContent,
           commentedTime: commentedTime?? this.commentedTime,
           commentOwnerName: commentOwnerName?? this.commentOwnerName,
           commentId: commentId?? this.commentId,
           commentRef: commentRef?? this.commentRef,
           commentOwnerDp: commentOwnerDp?? this.commentOwnerDp);
}
}