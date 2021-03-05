import 'dart:convert';
import 'dart:io';
import 'package:code_demo/core/config/local_variable.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';



class HttpRequest {
  static final HttpRequest instance = HttpRequest._();
  String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOjI3LCJSb2xlIjoxLCJleHAiOjE3NjA0OTE5NTl9.h1dIuSgmoqgZDVhIcEvLHc4o1FEhcfFx90Fwa410ATo';
  final int _timeOut = 30000; //30 s
  Dio _dio;
  DioCacheManager _dioCacheManager;
  Options _options;

  DioCacheManager get dioCacheManager {
    _dioCacheManager ??= DioCacheManager(CacheConfig(
        baseUrl: LocalVariable.instance.urlAPI,
        skipMemoryCache: true,
        skipDiskCache: true));
    return _dioCacheManager;
  }

  HttpRequest._() {
    final BaseOptions options = BaseOptions(
        connectTimeout: _timeOut,
        receiveTimeout: _timeOut,
        baseUrl: LocalVariable.instance.urlAPI,
        contentType: ContentType.json.value,
        responseType: ResponseType.plain);
    final String auth = 'Bearer ' + token ;
    options.headers.addAll(<String, String>{'authorization': auth});
    _dio = Dio(options);
    _dio.interceptors.add(dioCacheManager.interceptor);
  }

  Future<String> getAsync(String url, {Map<String, dynamic> headers}) async {
    try {
      _options = buildCacheOptions(const Duration(days: 7),
          maxStale: const Duration(days: 10));
      final Response response = await _dio.get(url, options: _options);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
      return null;
    }
  }

  Future<String> postAsync(String url, Map<String, dynamic> param,
      {Map<String, dynamic> headers}) async {
    try {
      _options = buildCacheOptions(const Duration(days: 7),
          maxStale: const Duration(days: 10));
      if (headers != null) _options.headers.addAll(headers);
      final String jso = jsonEncode(param);
      final Response response =
      await _dio.post(url, data: jso, options: _options);
      // await _dio.post(url, data: {"product_id": 10, "quantity": 1});
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {


      return null;
    }
  }





}
