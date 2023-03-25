import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dd3_challenge/src/config/app_config.dart';
import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  Map<String, String> _getMD5Hash() {
    final timeStamp = DateTime.now().millisecondsSinceEpoch;
    final input = '${timeStamp}${AppConfig.PRIVATE_KEY}${AppConfig.PUBLIC_KEY}';
    return {
      'hash': md5.convert(utf8.encode(input)).toString(),
      'ts': timeStamp.toString(),
    };
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    final data = _getMD5Hash();

    options.queryParameters = {
      'apikey': AppConfig.PUBLIC_KEY,
      'hash': data['hash'],
      'ts': data['ts']
    };

    return handler.next(options);
  }
}
