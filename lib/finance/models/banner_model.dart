
class BannerModel {
  String name, url ,link;
  int sort, skipType;

  BannerModel({this.name, this.url, this.link, this.sort, this.skipType});

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel (
    name: json["name"], 
    url: json["url"],
    link: json["link"], 
    sort: json["sort"],
    skipType: json["type"],
  );


  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "link": link,
    "sort": sort,
    "type": skipType,
  };
}