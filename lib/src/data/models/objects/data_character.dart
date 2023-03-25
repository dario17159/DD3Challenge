import 'dart:convert';

import 'package:dd3_challenge/src/data/models/base/data_base.dart';
import 'package:dd3_challenge/src/data/models/objects/character.dart';

class CharacterData extends BaseData {
  CharacterData({
    required int offset,
    required int limit,
    required int total,
    required int count,
    required this.characters,
  }) : super(
          offset: offset,
          limit: limit,
          total: total,
          count: count,
        );

  final List<Character> characters;

  factory CharacterData.fromJson(String str) =>
      CharacterData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharacterData.fromMap(Map<String, dynamic> json) => CharacterData(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        characters: List<Character>.from(
          json["results"].map(
            (x) => Character.fromMap(x),
          ),
        ),
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(
          characters.map(
            (x) => x.toMap(),
          ),
        ),
      };
}
