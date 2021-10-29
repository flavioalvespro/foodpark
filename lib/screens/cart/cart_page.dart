import 'package:flutter/material.dart';
import '../../widgets/show_image_cached.dart';
import '../../widgets/bottom_navigator.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Meu Carrinho'),
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
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(16),
      child: Text("Total (3) Itens", style: TextStyle(color: Colors.black),),
    );
  }

  Widget _buildCartList(context)
  {
    return ListView.builder(
        shrinkWrap: false,
        primary: true,
        itemCount: 6,
        itemBuilder: (context, index) => _buildCartItem(context),
      );
  }

  Widget _buildCartItem(context)
  {
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
                ShowImageCached('https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png'),
                _showDetailItemCart(context)
              ],
          ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
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
        )
      ],
    );
  }

  Widget _showDetailItemCart(context)
  {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 5, right: 4, left: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Pizza Grande', style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor), maxLines: 2,),
            Container(
              height: 6,
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                children: <Widget>[
                  Text("R\$ 48.88", style: TextStyle(color: Colors.green)),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.remove, size: 24, color: Colors.grey.shade700,),
                          Container(
                            padding: EdgeInsets.only(top: 4, bottom: 4, left: 12, right: 12),
                            color: Theme.of(context).primaryColor,
                            child: Text('2', style: TextStyle(color: Colors.white),),
                          ),
                          Icon(Icons.add, size: 24, color: Colors.grey.shade700,)
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
    );
  }

  Widget _buildTextTotalCart()
  {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Text("Preço Total: R\$ 49,99", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
    );
  }

  Widget _buildFormComment(context)
  {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        autocorrect: true,
        style: TextStyle(color: Theme.of(context).primaryColor),
        cursorColor: Theme.of(context).primaryColor,
        onSaved: (value) {
          print(value);
        },
        decoration: InputDecoration(
          labelText: 'Comentário (ex: sem cebola)',
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
      child: ElevatedButton(
        onPressed: () {
          print('checkout');
        },
        child: Text('Finalizar Pedido'),
        style: ElevatedButton.styleFrom(primary: Colors.orange[700], onPrimary: Colors.white, elevation: 4, shadowColor: Colors.black),
      ),
    );
  }
}