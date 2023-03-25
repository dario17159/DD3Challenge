import 'dart:convert';
import 'package:dd3_challenge/src/data/models/objects/data_of_detail.dart';
import 'package:dd3_challenge/src/data/models/response/base_response.dart';

class GetCharacterDataResponse extends BaseResponse{
    GetCharacterDataResponse({
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

    final DataOfDetail data;

    factory GetCharacterDataResponse.fromJson(String str) => GetCharacterDataResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetCharacterDataResponse.fromMap(Map<String, dynamic> json) => GetCharacterDataResponse(
        code: json["code"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: DataOfDetail.fromMap(json["data"]),
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

