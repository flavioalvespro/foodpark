// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriesStore on _CategoriesStoreBase, Store {
  final _$categoriesAtom = Atom(name: '_CategoriesStoreBase.categories');

  @override
  ObservableList<CategoryProduct> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<CategoryProduct> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CategoriesStoreBase.isLoading');

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

  final _$getCategoriesAsyncAction =
      AsyncAction('_CategoriesStoreBase.getCategories');

  @override
  Future<dynamic> getCategories(String tokenCompany) {
    return _$getCategoriesAsyncAction
        .run(() => super.getCategories(tokenCompany));
  }

  final _$_CategoriesStoreBaseActionController =
      ActionController(name: '_CategoriesStoreBase');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_CategoriesStoreBaseActionController.startAction(
        name: '_CategoriesStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(CategoryProduct category) {
    final _$actionInfo = _$_CategoriesStoreBaseActionController.startAction(
        name: '_CategoriesStoreBase.add');
    try {
      return super.add(category);
    } finally {
      _$_CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(CategoryProduct category) {
    final _$actionInfo = _$_CategoriesStoreBaseActionController.startAction(
        name: '_CategoriesStoreBase.remove');
    try {
      return super.remove(category);
    } finally {
      _$_CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_CategoriesStoreBaseActionController.startAction(
        name: '_CategoriesStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
isLoading: ${isLoading}
    ''';
  }
}
