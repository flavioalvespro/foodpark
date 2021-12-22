import 'package:foodpark/data/network/repositories/product_repository.dart';

import '../models/Product.dart';
import 'package:mobx/mobx.dart';
part 'products.store.g.dart';

class ProductsStore = _ProductsStoreBase with _$ProductsStore;

abstract class _ProductsStoreBase with Store {
  
  ProductRepository _repository = new ProductRepository();

  @observable
  ObservableList<Product> products = ObservableList<Product>();

  @observable
  ObservableList<Product> cartItems = ObservableList<Product>();

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  void addProduct(Product product) {
    products.add(product);

    products = products;
  }

  @action
  void addAll(List<Product> products) {
    products.addAll(products);
  }

  @action
  void removeProduct(Product product) {
    products.remove(product);

    products = products;
  }

  @action
  void clearProducts() {
    products.clear();

    products = products;
  }

  @action
  Future getProducts(String tokenCompany) async {
    setLoading(true);

    final response = await _repository.getProducts(tokenCompany);

    setLoading(false);

    response.map((product) {
      return addProduct(Product.fromJson(product));
    }).toList();
  }

  /**
   * cart 
   * */  
  @action
  void addProductCart(Product product)
  {
    cartItems.add(product);
  }

  @action
  void removeProductCart(Product product)
  {
    cartItems.remove(product);
  }

  @action
  void clearCart()
  {
    cartItems.clear();
  }

  @action
  bool inProductCart(Product product)
  {
    return cartItems.contains(product);
  }
}