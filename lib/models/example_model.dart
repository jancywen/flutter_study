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