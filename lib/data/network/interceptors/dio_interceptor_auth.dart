import 'package:dio/dio.dart';
import '../../../constants/api.dart';

Dio dioInterceptorAuth() {
  Dio dio = new Dio();

  //set defaul configs
  dio.options.baseUrl = API_URL;
  dio.options.connectTimeout = API_CONNECTION_TIMEOUT;
  dio.options.receiveTimeout = API_RECEIVE_TIMEOUT;

  dio.options.headers['Accept'] = 'application/json';

  return dio;
}