
import 'dart:convert';

class Url {
    Url({
        required this.type,
        required this.url,
    });

    final String type;
    final String url;

    factory Url.fromJson(String str) => Url.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Url.fromMap(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "type": type,
        "url": url,
    };
}