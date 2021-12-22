import 'package:foodpark/constants/api.dart';
import 'package:foodpark/data/network/dio_client.dart';

class ProductRepository {

  var _httpClient;

  ProductRepository() {
    _httpClient = new DioClient();
  }

  Future<List<dynamic>> getProducts(String tokenCompany) async {

    final response = await _httpClient.get("$API_VERSION/products", queryParams: {'token_company' : tokenCompany});
    
    return (response.data['data'] as List).toList();
  }
}