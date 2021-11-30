import 'package:flutter/material.dart';

import './constants/app_theme.dart';
import './routes.dart';

void main() => runApp(FoodPark());

class FoodPark extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodPark',
      theme: themeData,
      initialRoute: '/',
      routes: Routes.routes,
    );
  }

}