import 'package:flutter/material.dart';
import 'package:foodpark/stores/categories.store.dart';
import 'package:foodpark/stores/products.store.dart';
import 'package:provider/provider.dart';

import './constants/app_theme.dart';
import './routes.dart';

void main() => runApp(FoodPark());

class FoodPark extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductsStore>(
          create: (_) => ProductsStore(),
        ),
        Provider<CategoriesStore>(
          create: (_) => CategoriesStore(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FoodPark Delivery',
        theme: themeData,
        initialRoute: '/',
        routes: Routes.routes,
      ),
    );
  }

}