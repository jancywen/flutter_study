
class UserInfo {
  String id,
    nickname,
    iphone, 
    avatar;

  UserInfo({this.id, this.nickname, this.iphone, this.avatar});
  
  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    nickname: json["userName"],
    iphone: json["mobile"],
    avatar: json["userIcon"],
  );

  Map<String,dynamic> toJson() => {
    "id": id,
    "userName": nickname,
    "mobile": iphone,
    "userIcon": avatar,
  };

}