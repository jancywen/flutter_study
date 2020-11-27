


class ArticleModel {
  String id, title, authorName, firstPic, releaseTime, platformName;

  ArticleModel({
    this.id, 
    this.title, 
    this.authorName, 
    this.firstPic, 
    this.releaseTime, 
    this.platformName});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel (
    id: json["id"], 
    title: json["title"],
    authorName: json["authorName"], 
    firstPic: json["firstPic"],
    releaseTime: json["releaseTime"],
    platformName: json["platformName"]
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "authorName": authorName,
    "firstPic": firstPic,
    "releaseTime": releaseTime,
    "platformName": platformName,
  };
}