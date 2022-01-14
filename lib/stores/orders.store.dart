import 'package:foodpark/data/network/repositories/order_repository.dart';
import 'package:mobx/mobx.dart';
part 'orders.store.g.dart';

class OrdersStore = _OrdersStoreBase with _$OrdersStore;

abstract class _OrdersStoreBase with Store {

  OrderRepository _orderRepository = new OrderRepository();
  
  @observable
  bool isMakingOrder = false;

  @action
  Future makeOrder(String tokenCompany, List<Map<String, dynamic>> products, String? comment) async
  {
    isMakingOrder = true;

    await _orderRepository.makeOrder(tokenCompany, products, comment: comment);

    isMakingOrder = false;
  }
}