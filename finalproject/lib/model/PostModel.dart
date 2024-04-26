List<Postmodel> postmodelFromJson(Map<String, dynamic> json) {
  final List<dynamic> jsonData = json['data'];
  return List<Postmodel>.from(jsonData.map((x) => Postmodel.fromJson(x)));
}

class Postmodel {
  Postmodel({
    required this.imageUrl,
    required this.title,
    required this.isoDate,
    required this.contentSnippet,
  });

  String imageUrl;
  String title;
  String isoDate;
  String contentSnippet;

  factory Postmodel.fromJson(Map<String, dynamic> json) => Postmodel(
      imageUrl: json["image"]["large"] ?? '',
      title: json["title"] ?? '',
      isoDate: json["isoDate"] ?? '',
      contentSnippet: json["contentSnippet"] ?? '');
  Map<String, dynamic> toJson() => {
        "image": imageUrl,
        "title": title,
        "isoDate": isoDate,
        "contentSnippet": contentSnippet,
      };
}
