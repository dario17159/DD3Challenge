
import 'dart:convert';

import 'package:dd3_challenge/src/data/models/objects/item_data.dart';
import 'package:dd3_challenge/src/data/models/objects/thumbnail.dart';
import 'package:dd3_challenge/src/data/models/objects/url.dart';

class Character {
    Character({
        required this.id,
        required this.name,
        required this.description,
        required this.modified,
        required this.thumbnail,
        required this.resourceUri,
        required this.comics,
        required this.series,
        required this.stories,
        required this.events,
        required this.urls,
    });

    final String id;
    final String name;
    final String description;
    final String modified;
    final Thumbnail thumbnail;
    final String resourceUri;
    final ItemData comics;
    final ItemData series;
    final ItemData stories;
    final ItemData events;
    final List<Url> urls;

    factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Character.fromMap(Map<String, dynamic> json) => Character(
        id: json["id"].toString(),
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: ItemData.fromMap(json["comics"]),
        series: ItemData.fromMap(json["series"]),
        stories: ItemData.fromMap(json["stories"]),
        events: ItemData.fromMap(json["events"]),
        urls: List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail.toMap(),
        "resourceURI": resourceUri,
        "comics": comics.toMap(),
        "series": series.toMap(),
        "stories": stories.toMap(),
        "events": events.toMap(),
        "urls": List<dynamic>.from(urls.map((x) => x.toMap())),
    };
}