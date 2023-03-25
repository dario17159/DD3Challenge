
import 'dart:convert';

import 'package:dd3_challenge/src/data/models/objects/item.dart';

class ItemData {
    ItemData({
        required this.available,
        required this.collectionUri,
        required this.items,
        required this.returned,
    });

    final int available;
    final String collectionUri;
    final List<Item> items;
    final int returned;

    factory ItemData.fromJson(String str) => ItemData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ItemData.fromMap(Map<String, dynamic> json) => ItemData(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        returned: json["returned"],
    );

    Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "returned": returned,
    };
}