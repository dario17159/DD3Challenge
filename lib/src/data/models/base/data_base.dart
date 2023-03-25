import 'dart:convert';

class BaseData {
  BaseData({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
  });

  final int offset;
  final int limit;
  final int total;
  final int count;

  factory BaseData.fromJson(String str) => BaseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BaseData.fromMap(Map<String, dynamic> json) => BaseData(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
      };
}
