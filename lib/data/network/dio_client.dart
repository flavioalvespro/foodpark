import 'package:dio/dio.dart';
import './interceptors/dio_interceptor.dart';

class DioClient {
  Dio? _dio;

  DioClient() {
    _dio = dioInterceptor();
  }

  Future<dynamic> get(String url, Map<String, dynamic> queryParams) async {
    try {
      final Response response = await _dio!.get(url, queryParameters: queryParams);
      print(response);

      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> post(String url, data, Map<String, dynamic> queryParams) async {
    try {
      final Response response = await _dio!.post(url, data: data, queryParameters: queryParams);
      print(response);

      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}