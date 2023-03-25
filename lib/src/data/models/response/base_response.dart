import 'dart:convert';

class BaseResponse {
  BaseResponse({
    required this.code,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.etag,
  });

  final int code;
  final String copyright;
  final String attributionText;
  final String attributionHtml;
  final String etag;

  factory BaseResponse.fromJson(String str) =>
      BaseResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BaseResponse.fromMap(Map<String, dynamic> json) => BaseResponse(
        code: json["code"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
      };
}
