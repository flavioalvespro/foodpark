import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodpark/data/network/dio_client.dart';
import 'package:foodpark/data/network/interceptors/dio_interceptor_auth.dart';
import 'package:foodpark/models/User.dart';

class AuthRepository {

  Dio _dio = dioInterceptorAuth();
  final storage = new FlutterSecureStorage();

  Future auth(String email, String password) async 
  {
    try {
      final response = await _dio.post('auth/token', data: {
        'email': email,
        'password': password,
        'device_name': 'teste'
      });

      print(response.data);

      saveToken(response.data['token']);

      return response;
    } on DioError catch (e) {
      print(e.toString());
    }
  }

  Future register(String name, String email, String password) async 
  {
    try {
      final response = await _dio.post('auth/register', data: {
        'name': name,
        'email': email,
        'password': password
      });

      return response;
    } on DioError catch (e) {
      print(e.toString());
    }
  }

  Future<User?> getMe() async 
  {
    final token = await storage.read(key: 'token_sanctum');

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer ' + token;
    }
    
    try {
      
      final response = await _dio.get('auth/me');
      return User.fromJson(response.data['data']);

    } on DioError catch (e) {
      print(e.toString());
    }

    return null;
  }

  Future saveToken(String token) async
  {
    await storage.write(key: 'token_sanctum', value: token);
  }
}