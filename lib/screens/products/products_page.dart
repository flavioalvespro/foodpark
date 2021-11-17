import 'package:flutter/material.dart';
import 'package:foodpark/widgets/product_card.dart';

import '../../models/Category.dart';
import '../../models/Product.dart';
import './widgets/Categories.dart';
import '../../widgets/bottom_navigator.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  List<Category> _categories = [
    Category(name: 'Pizzas', description: 'pizzas', identify: '1'),
    Category(name: 'Hambúrgueres', description: 'sanduiches', identify: '2'),
    Category(name: 'Esfirras', description: 'esfirras', identify: '3'),
    Category(name: 'Bebidas', description: 'bebidas', identify: '4')
  ];
  List<Product> _products = [
    Product(identify: '1', title: 'Pizza Grande', image: 'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png', price: '28.9', description: 'teste'),
    Product(identify: '2', title: 'Pizza Pequena', image: 'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png', price: '28.9', description: 'teste'),
    Product(identify: '3', title: 'Pizza Média', image: 'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png', price: '28.9', description: 'teste'),
    Product(identify: '4', title: 'Esfirra', image: 'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png', price: '28.9', description: 'teste'),
    Product(identify: '5', title: 'Açai', image: 'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png', price: '28.9', description: 'teste'),
    Product(identify: '6', title: 'Hambúrguer', image: 'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png', price: '28.9', description: 'teste'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arte da Pizza'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreen(),
      bottomNavigationBar: BottomNavigator(0),
    );
  }

  Widget _buildScreen() 
  {
    return Column(
      children: <Widget>[
        Categories(_categories),
        _buildProducts()
      ],
    );
  }

  Widget _buildProducts()
  {
    return Container(
      height: (MediaQuery.of(context).size.height - 190),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final Product product = _products[index];
          return ProductCard(identify: product.identify, title: product.title, price: product.price, description: product.description, image: product.image, showIconCart: false);
        }
      ),
    );
  }
}