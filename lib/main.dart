import 'package:flutter/material.dart';
import './screens/auth/login_page.dart';

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
      home: LoginScreen(),
    );
  }

}