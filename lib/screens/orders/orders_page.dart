import 'package:flutter/material.dart';

import '../../widgets/bottom_navigator.dart';
import '../../models/Order.dart';

class OrdersScreen extends StatelessWidget {
  
  List<Order> _orders = [
    Order(date: '30/10/2021', identify: '123456', status: 'fechado', comment: 'dsadsadas', table: '1', total: 12, products: [], evaluations: []),
    Order(date: '30/10/2021', identify: '123456', status: 'fechado', comment: 'dsadsadas', table: '1', total: 12, products: [], evaluations: []),
    Order(date: '30/10/2021', identify: '123456', status: 'fechado', comment: 'dsadsadas', table: '1', total: 12, products: [], evaluations: []),
    Order(date: '30/10/2021', identify: '123456', status: 'fechado', comment: 'dsadsadas', table: '1', total: 12, products: [], evaluations: []),
    Order(date: '30/10/2021', identify: '123456', status: 'fechado', comment: 'dsadsadas', table: '1', total: 12, products: [], evaluations: []),
    Order(date: '30/10/2021', identify: '123456', status: 'fechado', comment: 'dsadsadas', table: '1', total: 12, products: [], evaluations: []),
    Order(date: '30/10/2021', identify: '123456', status: 'fechado', comment: 'dsadsadas', table: '1', total: 12, products: [], evaluations: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildOrderScreen(context),
      bottomNavigationBar: BottomNavigator(1),
    );
  }

  Widget _buildOrderScreen(context)
  {
    return Column(
      children: <Widget>[
        _buildHeader(),
        _buildOrdersList()
      ],
    );
  }

  Widget _buildHeader()
  {
    return Container(
      margin: EdgeInsets.all(16),
      alignment: Alignment.topLeft,
      child: Text(
        'Meus Pedidos',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildOrdersList()
  {
    return Expanded(
      child: ListView.builder(
      //shrinkWrap: true,
      itemCount: _orders.length,
      itemBuilder: (context, index) {
        final Order order = _orders[index];
        return _buildItemOrder(order, context);
      },
    )
    );
  }

  Widget _buildItemOrder(Order order, context)
  {
    return ListTile(
      title: Text("Pedido #${order.identify}", style: TextStyle(color: Colors.black)),
      subtitle: Text("Data #${order.date}", style: TextStyle(color: Colors.black)),
      trailing: IconTheme(
        child: Icon(Icons.navigate_next),
        data: IconThemeData(color: Theme.of(context).primaryColor)
      ),
      onTap: () {
        print('yoga flame');
      },
    );
  }
}