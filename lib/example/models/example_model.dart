import 'dart:convert';


class ExampleModel {
  String time;
  String name;


  ExampleModel({
    this.time,
    this.name
  });

  factory ExampleModel.fromJson(Map<String, dynamic> json) => ExampleModel (
    name: json["name"], 
    time: json["time"]);


  Map<String, dynamic> toJson() => {
    "time": time,
    "name": name,
  };

}


class ExampleSubModel {
  DateTime dateTime;
  int status;
  List<ExampleElementModel> elementList;

  ExampleSubModel({
    this.dateTime,
    this.status,
    this.elementList,
  });

  factory ExampleSubModel.fromJson(Map<String, dynamic> json) => ExampleSubModel (
    dateTime: DateTime.parse(json["dateTime"]), 
    status: json["status"], 
    elementList: List<ExampleElementModel>.from(json["elementList"].map((x) => ExampleElementModel.fromJson(x))));

  Map<String, dynamic> toJson() => {
    "dateTime": dateTime.toIso8601String(),
    "status": status,
    "elementList": List<dynamic>.from(elementList.map((e) => e.toJson())),
  };
}


class ExampleElementModel {
  int id;

  ExampleElementModel({
    this.id
    });

  factory ExampleElementModel.fromJson(Map<String, dynamic> json) => ExampleElementModel (
    id: json["id"]);

  Map<String, dynamic> toJson()=> {
    "id": id,
  };

}


class ExampleSimpleModel {
  String p1;
  String p2;
  String p3;

  ExampleSimpleModel({this.p1, this.p2, this.p3});

  factory ExampleSimpleModel.fromJson(Map<String, dynamic> json) => ExampleSimpleModel(
    p1: json["p1"],
    p2: json["p2"],
    p3: json["p3"]);
  
  Map<String, dynamic> toJson() => {
    "p1": p1,
    "p2": p2,
    "p3": p3
  };

}

class ExampleHomeModel {
  List<ExampleBannerModel> banners;
  List<ExampleBrandModel> brands;
  List<ExampleProductModel> products;

  ExampleHomeModel({this.banners, this.brands, this.products});

  factory ExampleHomeModel.fromJson(Map<String, dynamic> json) => ExampleHomeModel(
    banners: List<ExampleBannerModel>.from(json["banners"].map((x)=> ExampleBannerModel.fromJson(x))),
    brands: List<ExampleBrandModel>.from(json["brands"].map((x) => ExampleBrandModel.fromJson(x))),
    products: List<ExampleProductModel>.from(json["products"].map((x) => ExampleProductModel.fromJson(x)))
    );

}

/// banner
class ExampleBannerModel {
  String imgUrl;
  String linkUrl;

  ExampleBannerModel({this.imgUrl, this.linkUrl});

  factory ExampleBannerModel.fromJson(Map<String, dynamic> json) => ExampleBannerModel(
    imgUrl: json["imgUrl"], 
    linkUrl: json["linkUrl"]
    );
  
  Map<String, dynamic> toJson() => {
    "imgUrl": imgUrl,
    "linkUrl": linkUrl,
  };

}

/// 品牌
class ExampleBrandModel {
  String name;
  String icon;

  ExampleBrandModel({this.name, this.icon});

  factory ExampleBrandModel.fromJson(Map<String, dynamic> json) => ExampleBrandModel(
    name: json["name"], 
    icon: json["icon"]
    );
  
  Map<String, dynamic> toJson() => {
    "name": name,
    "icon": icon,
  };

}

/// 商品
class ExampleProductModel {
  String name;
  String icon;

  ExampleProductModel({this.name, this.icon});

  factory ExampleProductModel.fromJson(Map<String, dynamic> json) => ExampleProductModel(
    name: json["name"], 
    icon: json["icon"]
    );
  
  Map<String, dynamic> toJson() => {
    "name": name,
    "icon": icon,
  };

}