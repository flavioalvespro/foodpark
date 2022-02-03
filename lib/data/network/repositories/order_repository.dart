import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodpark/constants/api.dart';
import 'package:foodpark/data/network/dio_client.dart';

class OrderRepository {

  DioClient _httpClient = new DioClient();
  var  storage;

  OrderRepository() {
     storage = new FlutterSecureStorage();
  }

  Future makeOrder(String tokenCompany, List<Map<String, dynamic>> products, {String? comment}) async
  {
    final response = await _httpClient.post("/$API_VERSION/orders", formData: {
      'token_company': tokenCompany,
      'products': products,
      'comment': comment
    });

    return response;
  }

  Future<List<dynamic>> getMyOrders() async
  {
    final token = await storage.read(key: 'token_sanctum');
    
    if (token != null) {
      _httpClient.addTokenBearer(token);
    }
    
    final response = await _httpClient.get("auth/v1/my-orders");
    
    return (response.data['data'] as List).toList();
  }
}