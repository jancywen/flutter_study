
class BannerModel {
  String name, url ,link;
  int sort;

  BannerModel({this.name, this.url, this.link, this.sort});

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel (
    name: json["name"], 
    url: json["url"],
    link: json["link"], 
    sort: json["sort"]
  );


  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "link": link,
    "sort": sort,
  };
}