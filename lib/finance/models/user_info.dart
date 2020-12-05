
class UserInfo {
  String id,
    nickname,
    iphone, 
    avatar;

  UserInfo({this.id, this.nickname, this.iphone, this.avatar});
  
  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    nickname: json["nickname"],
    iphone: json["iphone"],
    avatar: json["avatar"],
  );

  Map<String,dynamic> toJson() => {
    "id": id,
    "nickname": nickname,
    "iphone": iphone,
    "avatar": avatar,
  };

}