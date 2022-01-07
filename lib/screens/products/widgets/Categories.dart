import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodpark/stores/categories.store.dart';
import 'package:provider/provider.dart';

import '../../../models/CategoryProduct.dart';

class Categories extends StatelessWidget {
  List<CategoryProduct> _categories;

  late CategoriesStore _categoriesStore;

  Categories(
    this._categories
  );

  @override
  Widget build(BuildContext context) {
    this._categoriesStore = Provider.of<CategoriesStore>(context);
    return _buildCategories();
  }

  Widget _buildCategories()
  {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final CategoryProduct category = _categories[index];
          return _buildCategory(category);
        },
      ),
    );
  }
  Widget _buildCategory(CategoryProduct category)
  {
    final String identifyCategory = category.identify;

    return GestureDetector(
        onTap: () => {
          this._categoriesStore.inFilter(identifyCategory) ? this._categoriesStore.removeFilter(identifyCategory) : this._categoriesStore.addFilter(identifyCategory)
        },
        child: Container(
          padding: EdgeInsets.only(top: 2, bottom: 2, left: 20, right: 20),
          margin: EdgeInsets.all(5),
          child: Center(child: Text(category.name, style: TextStyle(color: this._categoriesStore.inFilter(identifyCategory) ? Colors.black : Colors.grey, fontWeight: FontWeight.bold))),
          decoration: BoxDecoration(
            border: Border.all(color: this._categoriesStore.inFilter(identifyCategory) ? Colors.black : Colors.grey),
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }
}