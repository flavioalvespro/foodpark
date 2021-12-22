import 'package:foodpark/constants/api.dart';
import 'package:foodpark/data/network/dio_client.dart';

class CategoryRepository {

  var _httpClient;

  CategoryRepository() {
    _httpClient = new DioClient();
  }

  Future<List<dynamic>> getCategories(String tokenCompany) async {

    final response = await _httpClient.get("$API_VERSION/categories", queryParams: {'token_company' : tokenCompany});
    
    return (response.data['data'] as List).toList();
  }
}