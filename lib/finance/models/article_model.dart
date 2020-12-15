import 'package:flutter_study/finance/util/time_util.dart';



class ArticleModel {
  String id, title, authorName, firstPic, releaseTime, platformName, content, authorIcon;

  String hourMinuteTime() {
    return shortTime(this.releaseTime);
  }
  String formateTime() {
    return formattingTime(this.releaseTime);
  }

  ArticleModel({
    this.id, 
    this.title, 
    this.authorName, 
    this.firstPic, 
    this.releaseTime, 
    this.platformName, 
    this.content, 
    this.authorIcon});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel (
    id: json["id"], 
    title: json["title"],
    authorName: json["authorName"], 
    firstPic: json["firstPic"],
    releaseTime: json["releaseTime"],
    platformName: json["platformName"], 
    content: json["content"],
    authorIcon: json["authorIcon"],
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "authorName": authorName,
    "firstPic": firstPic,
    "releaseTime": releaseTime,
    "platformName": platformName,
    "content": content,
    "authorIcon": authorIcon
  };
}