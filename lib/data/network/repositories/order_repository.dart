import 'package:foodpark/constants/api.dart';
import 'package:foodpark/data/network/dio_client.dart';

class OrderRepository {

  var _httpClient;

  OrderRepository() {
    _httpClient = new DioClient();
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
}