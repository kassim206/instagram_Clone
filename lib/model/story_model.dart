import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

StoryModel? storypost;

class StoryModel {
  String? userId;
  String? userName;
  String? storyid;
  List? viewers;
  List? likesList;
  DateTime? uploadedTime;
  String? storyUrl;
  DocumentReference? storyRef;
  StoryModel({
    required this.userId,
    required this.userName,
    required this.viewers,
    required this.likesList,
    required this.storyUrl,
    required this.uploadedTime,
    this.storyRef,
    this.storyid
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> story = <String, dynamic>{};
    story["userName"] = userName;
    story["uid"] = userId;
    story["viewers"] = viewers;
    story["likes"] = likesList;
    story["storyUrl"] = storyUrl;
    story["ref"] = storyRef;
    story["uploadedTime"] = uploadedTime;
    story["storyId"] = storyid;
    return story;
  }

  StoryModel.fromJson(Map<String, dynamic> json) {
    userName = json["userName"] ?? '';
    userId = json["uid"] ?? '';
    viewers = json["viewers"] ?? '';
    likesList = json["likes"] ?? [];
    storyRef = json["ref"] ?? null;
    uploadedTime = json["uploadedTime"] == null
        ? DateTime.now()
        : json["uploadedTime"].toDate();
    storyUrl = json["storyUrl"] ?? "";
    storyid = json["storyId"] ?? "";
  }
  StoryModel copyWith({
    String? userId,
    String? userName,
    List? viewers,
    String? storyDescription,
    List? likesList,
    DateTime? uploadedTime,
    String? storyUrl,
    String? storyid,
    DocumentReference? storyRef,
  }) {
    return StoryModel(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        viewers: viewers ?? this.viewers,
        likesList: likesList ?? this.likesList,
        storyUrl: storyUrl ?? this.storyUrl,
        storyRef: storyRef ?? this.storyRef,
        storyid: storyid??this.storyid,
        uploadedTime: uploadedTime ?? this.uploadedTime);
  }
}