import 'package:dio/dio.dart';
import './interceptors/dio_interceptor.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    this._dio = dioInterceptor();
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? queryParams}) async {
    try {
      
      final Response response = await _dio.get(url, queryParameters: queryParams);

      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> post(String url, {formData, Map<String, dynamic>? queryParams}) async {
    try {
      final Response response = await _dio.post(url, data: formData, queryParameters: queryParams);

      return response;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  void addTokenBearer(String token)
  {
    _dio.options.headers['Authorization'] = 'Bearer ' + token;
  }
}