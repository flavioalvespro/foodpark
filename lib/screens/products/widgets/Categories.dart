import 'package:flutter/material.dart';

import '../../../models/CategoryProduct.dart';

class Categories extends StatelessWidget {
  List<CategoryProduct> _categories;

  Categories(this._categories);

  @override
  Widget build(BuildContext context) {
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
    return Container(
      padding: EdgeInsets.only(top: 2, bottom: 2, left: 20, right: 20),
      child: Center(child: Text(category.name, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(100)
      ),
    );
  }
}