import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodpark/stores/orders.store.dart';
import 'package:foodpark/widgets/custom_ciscular_progress_indicator.dart';
import 'package:provider/provider.dart';

import '../../widgets/bottom_navigator.dart';
import '../../models/Order.dart';

class OrdersScreen extends StatelessWidget {
  
  late OrdersStore _ordersStore;

  @override
  Widget build(BuildContext context) {
    
    _ordersStore = Provider.of<OrdersStore>(context);
    _ordersStore.getMyOrders();

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Observer(
        builder: (context) => _buildOrderScreen(context),
      ),
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
      itemCount: _ordersStore.orders.length,
      itemBuilder: (context, index) {
        final Order order = _ordersStore.orders[index];
        
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
        Navigator.pushNamed(context, '/order-details', arguments: order);
      },
    );
  }
}