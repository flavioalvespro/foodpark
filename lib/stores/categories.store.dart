import 'package:flutter/foundation.dart';
import 'package:foodpark/data/network/repositories/category_repository.dart';
import '../models/CategoryProduct.dart';
import 'package:mobx/mobx.dart';
part 'categories.store.g.dart';

class CategoriesStore = _CategoriesStoreBase with _$CategoriesStore;

abstract class _CategoriesStoreBase with Store {

  CategoryRepository repository = new CategoryRepository();
  
  @observable
  ObservableList<CategoryProduct> categories = ObservableList<CategoryProduct>();

  @observable
  List<String> filtersCategory = [];

  @observable
  bool filterChanged = false;

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value)
  {
    isLoading = value;
  }

  @action
  void addFilter(String identify)
  {
    filtersCategory.add(identify);

    categories = categories;

    filterChanged = !filterChanged;
  }

  @action
  void removeFilter(String identify)
  {
    filtersCategory.remove(identify);

    categories = categories;

    filterChanged = !filterChanged;
  }

  @action
  bool inFilter(String identify)
  {
    return filtersCategory.contains(identify);
  }

  @action
  void clearFilter()
  {
    filtersCategory.clear();

    categories = categories;

    filterChanged = !filterChanged;
  }

  @action
  void add(CategoryProduct category) 
  {
    categories.add(category);
  }

  @action
  void remove(CategoryProduct category) 
  {
    categories.remove(category);
  }

  @action
  void clear() 
  {
    categories.clear();
  }

  @action
  Future getCategories(String tokenCompany) async 
  {
    setLoading(true);
    clear();
    clearFilter();

    final response = await repository.getCategories(tokenCompany);

    setLoading(false);

    response.map((category) => add(CategoryProduct.fromJson(category))).toList();
  }
}