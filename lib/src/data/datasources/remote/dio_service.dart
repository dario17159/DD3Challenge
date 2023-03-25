import 'package:dd3_challenge/src/config/app_config.dart';
import 'package:dd3_challenge/src/config/app_interceptor.dart';
import 'package:dio/dio.dart';

class DioService {
  static Dio? _dio;
  static final DioService dio = DioService._();

  DioService._();

  Future<Dio> get dioService async {
    if (_dio != null) {
      return _dio!;
    }

    _dio = await initDio();

    return _dio!;
  }

  Future<Dio> initDio() async {
    // Initialize options to configure dio
    BaseOptions options = new BaseOptions(
      baseUrl: AppConfig.BASE_URL,
      receiveDataWhenStatusError: true,
      headers: {
        'Content-type': 'application/json'
      },
      );

    _dio = new Dio(options);
    _dio!.interceptors.add(AppInterceptor());
    return _dio!;
  }
}