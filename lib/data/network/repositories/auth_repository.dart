import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
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
      String? deviceName = await getIdentifyDevice();

      final response = await _dio.post('auth/token', data: {
        'email': email,
        'password': password,
        'device_name': deviceName
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
      
      final response = await _dio.get('/me');
      return User.fromJson(response.data['data']);

    } on DioError catch (e) {
      print(e.toString());
    }
  }

  Future saveToken(String token) async
  {
    await storage.write(key: 'token_sanctum', value: token);
  }

  Future deleteToken() async
  {
    await storage.delete(key: 'token_sanctum');
  }

  Future logout() async 
  {
    await _dio.post('auth/logout');
    await deleteToken();
  }

  Future<String?> getIdentifyDevice() async 
  {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
    
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine; 

    } else {
      
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
      
    }
  }
}