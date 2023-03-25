import 'dart:convert';

class Item {
    Item({
        required this.resourceUri,
        required this.name,
    });

    final String resourceUri;
    final String name;

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        resourceUri: json["resourceURI"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
    };
}