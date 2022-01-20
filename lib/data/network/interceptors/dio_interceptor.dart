import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../constants/api.dart';

Dio dioInterceptor() {
  Dio dio = new Dio();
  final storage = new FlutterSecureStorage();

  //set defaul configs
  dio.options.baseUrl = API_URL;
  dio.options.connectTimeout = API_CONNECTION_TIMEOUT;
  dio.options.receiveTimeout = API_RECEIVE_TIMEOUT;

  dio.interceptors.add(InterceptorsWrapper(
    onRequest:(options, handler) async {

     dio.options.headers['Accept'] = 'application/json';

     final token = await storage.read(key: 'token_sanctum');

     if (token != null) {
       dio.options.headers['Authorization'] = 'Bearer ' + token;
     }

     return handler.next(options);
    }
  ));

  return dio;
}