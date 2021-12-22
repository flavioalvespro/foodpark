import 'package:foodpark/constants/api.dart';
import 'package:foodpark/data/network/dio_client.dart';
import 'package:foodpark/models/Tenant.dart';

class TenantRepository {

  var _httpClient;

  TenantRepository() {
    _httpClient = new DioClient();
  }

  Future<List<Tenant>> getTenants() async
  {
    final response = await _httpClient.get('$API_VERSION/tenants');
    final _tenants = (response.data['data'] as List).map((tenant) {
      //_tenants.add(Tenant.fromJson(tenant));
      return Tenant.fromJson(tenant);
    }).toList();

    return _tenants;
  }
}