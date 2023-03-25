import 'dart:convert';

import 'package:dd3_challenge/src/data/models/base/data_base.dart';
import 'package:dd3_challenge/src/data/models/objects/detail_data.dart';

class DataOfDetail extends BaseData {
  DataOfDetail({
    required int offset,
    required int limit,
    required int total,
    required int count,
    required this.detailData,
  }) : super(
          offset: offset,
          limit: limit,
          total: total,
          count: count,
        );

  final List<DetailData> detailData;

  factory DataOfDetail.fromJson(String str) =>
      DataOfDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataOfDetail.fromMap(Map<String, dynamic> json) => DataOfDetail(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        detailData: List<DetailData>.from(
          json["results"].map(
            (x) => DetailData.fromMap(x),
          ),
        ),
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(
          detailData.map(
            (x) => x.toMap(),
          ),
        ),
      };
}
