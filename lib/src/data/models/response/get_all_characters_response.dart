import 'dart:convert';

import 'package:dd3_challenge/src/data/models/objects/data_character.dart';
import 'package:dd3_challenge/src/data/models/response/base_response.dart';

class GetAllCharactersResponse extends BaseResponse{
    GetAllCharactersResponse({
        required int code,
        required String copyright,
        required String attributionText,
        required String attributionHtml,
        required String etag,
        required this.data,
    }):super(
        code:code,
        copyright:copyright,
        attributionText:attributionText,
        attributionHtml:attributionHtml,
        etag:etag,
    );

    final CharacterData data;

    factory GetAllCharactersResponse.fromJson(String str) => GetAllCharactersResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetAllCharactersResponse.fromMap(Map<String, dynamic> json) => GetAllCharactersResponse(
        code: json["code"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: CharacterData.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data.toMap(),
    };
}

