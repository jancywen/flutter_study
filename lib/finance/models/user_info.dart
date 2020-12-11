
class UserInfo {
  String id,
    nickname,
    mobile, 
    avatar;

  UserInfo({this.id, this.nickname, this.mobile, this.avatar});
  
  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    nickname: json["userName"],
    mobile: json["mobile"],
    avatar: json["userIcon"],
  );

  Map<String,dynamic> toJson() => {
    "id": id,
    "userName": nickname,
    "mobile": mobile,
    "userIcon": avatar,
  };

}