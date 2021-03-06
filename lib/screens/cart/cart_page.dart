import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:foodpark/models/Product.dart';
import 'package:foodpark/stores/orders.store.dart';
import 'package:foodpark/stores/products.store.dart';
import 'package:foodpark/stores/tenant.store.dart';
import 'package:provider/provider.dart';
import '../../widgets/show_image_cached.dart';
import '../../widgets/bottom_navigator.dart';

class CartPage extends StatelessWidget {
  
  late ProductsStore _productsStore;
  late TenantsStore _tenantsStore;
  late OrdersStore _ordersStore;
  TextEditingController _commentController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    _productsStore = Provider.of<ProductsStore>(context);
    _tenantsStore = Provider.of<TenantsStore>(context);
    _ordersStore = Provider.of<OrdersStore>(context);

    final String titlePage = _tenantsStore.tenant != null ? "Carrinho - ${_tenantsStore.tenant!.name}" : 'Carrinho';

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(titlePage),
        centerTitle: true,
      ),
      body: _buildContentCart(context),
      bottomNavigationBar: BottomNavigator(2),
    );
  }

  Widget _buildContentCart(context)
  {
    return 
      Container(
      height: (MediaQuery.of(context).size.width + 140),
      child: Column(
        children: <Widget>[
          _buildHeader(),
          Expanded(child: _buildCartList(context)),
          _buildTextTotalCart(),
          _buildFormComment(context),
          _buttonCheckout(context)
        ],
      ),
    );
  }

  Widget _buildHeader()
  {
    return Observer(
      builder: (context) => Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(16),
      child: Text("Total (${_productsStore.cartItems.length}) Itens", style: TextStyle(color: Colors.black),),
    ),
    );
  }

  Widget _buildCartList(context)
  {
    return Observer(
      builder: (context) => ListView.builder(
        shrinkWrap: false,
        primary: true,
        itemCount: _productsStore.cartItems.length,
        itemBuilder: (context, index) {
          final Map<String, dynamic> itemCart = _productsStore.cartItems[index];
          return _buildCartItem(itemCart, context);
        },
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> itemCart, context)
  {
    final Product product = itemCart['product'];

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: Row(
              children: <Widget>[
                ShowImageCached(
                  product.image != null ? product.image :
                  'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png'
                ),
                _showDetailItemCart(product, itemCart, context)
              ],
          ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () => {
              _productsStore.removeProductCart(product)
            },
            child: Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(top: 2, right: 4),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            child: Icon(Icons.close, size: 20, color: Colors.white,),
          ),
          ),
        )
      ],
    );
  }

  Widget _showDetailItemCart(Product product, Map<String, dynamic> itemCart, context)
  {
    return Expanded(
      child: Observer(
        builder: (context) => Container(
        padding: EdgeInsets.only(top: 5, right: 4, left: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(product.title, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor), maxLines: 2,),
            Container(
              height: 6,
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                children: <Widget>[
                  Text("R\$ ${product.price}", style: TextStyle(color: Colors.green)),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => {
                              _productsStore.decrementProductCart(product)
                            },
                            child: Icon(Icons.remove, size: 24, color: Colors.grey.shade700,),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 12),
                            color: Theme.of(context).primaryColor,
                            child: Text(itemCart['qty'].toString(), style: TextStyle(color: Colors.white),),
                          ),
                          GestureDetector(
                            onTap: () => {
                              _productsStore.incrementProductCart(product)
                            },
                            child: Icon(Icons.add, size: 24, color: Colors.grey.shade700,),
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            )
          ],
        )
      )
       )
    );
  }

  Widget _buildTextTotalCart()
  {
    return Observer(
      builder: (context) => 
        Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Text("Pre??o Total: R\$ ${_productsStore.totalCart}", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
    )
      ,
    );
  }

  Widget _buildFormComment(context)
  {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: _commentController,
        autocorrect: true,
        style: TextStyle(color: Theme.of(context).primaryColor),
        cursorColor: Theme.of(context).primaryColor,
        onSaved: (value) {
          print(value);
        },
        decoration: InputDecoration(
          labelText: 'Coment??rio (ex: sem cebola)',
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Theme.of(context).primaryColor)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Theme.of(context).primaryColor)
          )
        ),
      ),
    );
  }

  Widget _buttonCheckout(context)
  {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 8),
      width: (MediaQuery.of(context).size.width - 8),
      child: Observer(
        builder: (context) => ElevatedButton(
        onPressed: () {
          _ordersStore.isMakingOrder ? null : _makeOrder(context);
        },
        child: _ordersStore.isMakingOrder ? Text('Fazendo o Pedido...') : Text('Finalizar Pedido'),
        style: ElevatedButton.styleFrom(primary: Colors.orange[700], onPrimary: Colors.white, elevation: 4, shadowColor: Colors.black),
      ),
      ),
    );
  }

  Future _makeOrder(context) async
  {
    await _ordersStore.makeOrder(_tenantsStore.tenant!.uuid, _productsStore.cartItems, _commentController.text);

    _productsStore.clearCart();
    _commentController.text = '';

    Navigator.pushReplacementNamed(context, '/my-orders');
  }
}