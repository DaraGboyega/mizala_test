import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppDio with DioMixin implements Dio {
  AppDio._([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: "https://api.unsplash.com",
      contentType: 'application/json',
      connectTimeout: 40000,
      sendTimeout: 40000,
      receiveTimeout: 40000,
    );

    this.options = options;

    final cacheOptions = CacheOptions(store: MemCacheStore());

    interceptors.add((DioCacheInterceptor(options: cacheOptions)));

    interceptors.add(PrettyDioLogger(requestBody: true, requestHeader: true));

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}
