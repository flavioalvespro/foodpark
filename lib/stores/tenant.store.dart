import 'package:foodpark/models/Tenant.dart';
import 'package:mobx/mobx.dart';
part 'tenant.store.g.dart';

class TenantsStore = _TenantsStoreBase with _$TenantsStore;

abstract class _TenantsStoreBase with Store {

  @observable
  late Tenant? tenant = null;

  @action
  void setTenant(Tenant value)
  {
    tenant = value;
  } 
}