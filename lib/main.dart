import 'package:flutter/material.dart';

import './screens/tenants/tenants_page.dart';
import './screens/auth/register_page.dart';
import './screens/auth/login_page.dart';
import './screens/products/products_page.dart';
import './screens/cart/cart_page.dart';
import './screens/orders/orders_page.dart';
import './screens/orders/order_detail.dart';
import './screens/orders/evaluation_order.dart';

void main() => runApp(FoodPark());

class FoodPark extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodPark',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(147, 70, 248, 1),
        backgroundColor: Colors.white,
        accentColor: Colors.black,
        brightness: Brightness.dark
      ),
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/tenants': (context) => TenantsPage(),
        '/products': (context) => ProductsScreen(),
        '/cart': (context) => CartPage(),
        '/orders': (context) => OrdersScreen(),
        '/order-details': (context) => OrderDetailsScreen(),
        '/evaluation-order': (context) => EvaluationScreen()
      },
    );
  }

}