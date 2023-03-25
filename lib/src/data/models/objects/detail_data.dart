// To parse this JSON data, do
//
//     final detailData = detailDataFromMap(jsonString);

import 'package:dd3_challenge/src/data/models/objects/thumbnail.dart';
import 'dart:convert';

class DetailData {
  DetailData({
    required this.id,
    required this.title,
    required this.resourceUri,
    this.thumbnail,
    this.description,
  });

  final String id;
  final String title;
  String? description;
  final String resourceUri;
  Thumbnail? thumbnail;

  factory DetailData.fromJson(String str) =>
      DetailData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailData.fromMap(Map<String, dynamic> json) => DetailData(
        id: json["id"].toString(),
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        thumbnail: json["thumbnail"] != null
            ? Thumbnail.fromMap(json["thumbnail"])
            : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "resourceURI": resourceUri,
        "thumbnail": thumbnail?.toMap(),
      };
}
