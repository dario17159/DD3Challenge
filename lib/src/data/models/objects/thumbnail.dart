
import 'dart:convert';

class Thumbnail {
    Thumbnail({
        required this.path,
        required this.extension,
    });

    final String path;
    final String extension;

    factory Thumbnail.fromJson(String str) => Thumbnail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
    );

    Map<String, dynamic> toMap() => {
        "path": path,
        "extension": extension,
    };
}