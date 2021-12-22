// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsStore on _ProductsStoreBase, Store {
  final _$productsAtom = Atom(name: '_ProductsStoreBase.products');

  @override
  ObservableList<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ProductsStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getProductsAsyncAction =
      AsyncAction('_ProductsStoreBase.getProducts');

  @override
  Future<dynamic> getProducts(String tokenCompany) {
    return _$getProductsAsyncAction.run(() => super.getProducts(tokenCompany));
  }

  final _$_ProductsStoreBaseActionController =
      ActionController(name: '_ProductsStoreBase');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_ProductsStoreBaseActionController.startAction(
        name: '_ProductsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addProduct(Product product) {
    final _$actionInfo = _$_ProductsStoreBaseActionController.startAction(
        name: '_ProductsStoreBase.addProduct');
    try {
      return super.addProduct(product);
    } finally {
      _$_ProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAll(List<Product> products) {
    final _$actionInfo = _$_ProductsStoreBaseActionController.startAction(
        name: '_ProductsStoreBase.addAll');
    try {
      return super.addAll(products);
    } finally {
      _$_ProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(Product product) {
    final _$actionInfo = _$_ProductsStoreBaseActionController.startAction(
        name: '_ProductsStoreBase.removeProduct');
    try {
      return super.removeProduct(product);
    } finally {
      _$_ProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearProducts() {
    final _$actionInfo = _$_ProductsStoreBaseActionController.startAction(
        name: '_ProductsStoreBase.clearProducts');
    try {
      return super.clearProducts();
    } finally {
      _$_ProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
isLoading: ${isLoading}
    ''';
  }
}
