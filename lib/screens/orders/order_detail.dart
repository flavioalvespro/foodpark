import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpark/models/Evaluation.dart';
import 'package:foodpark/models/Order.dart';
import 'package:foodpark/models/Product.dart';
import 'package:foodpark/widgets/bottom_navigator.dart';
import '../../widgets/product_card.dart';

// ignore: must_be_immutable
class OrderDetailsScreen extends StatelessWidget {
  
  late Order _order;

  @override
  Widget build(BuildContext context) {

    RouteSettings settings = ModalRoute.of(context)!.settings;
    _order = settings.arguments as Order;

    return Container(
      height: 1000,
      child: Scaffold(
      appBar: AppBar(title: Text('Detalhes do Pedido'),centerTitle: true),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildOrderDetails(context),
      bottomNavigationBar: BottomNavigator(1),
    ),
    );
  }

  Widget _buildOrderDetails(context)
  {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Detalhes: ', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
          Container(height: 5,),
          _buildTextOrder('Número: ', _order.identify),
          _buildTextOrder('Data: ', _order.date),
          _buildTextOrder('Status: ', _order.status),
          _buildTextOrder('Total: ', _order.total.toString()),
          _order.comment != null ? _buildTextOrder('Comentário: ', _order.comment) : Container(),
          Container(height: 8,),
          Text('Produtos: ', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
          Container(height: 8,),
          _buildProductsOrder(),
          Container(height: 8,),
          Text('Avaliação: ', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
          Container(height: 8,),
          _buildEvaluationsOrder(context),
        ],
      ),
    );
  }

  Widget _buildTextOrder(String textLabel, String textValue)
  {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: <Widget>[
          Text(textLabel, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Text(textValue, style: TextStyle(color: Colors.black))
        ],
      )
    );
  }

  Widget _buildProductsOrder()
  {
    return Container(
      height: 170,
      child: ListView.builder(
        itemCount: _order.products.length,
        itemBuilder: (context, index) {
          final Product product = _order.products[index];
          return ProductCard(product: product, showIconCart: true);
        }
      ),
    );
  }

  Widget _buildEvaluationsOrder(context)
  {
    return _order.evaluations.length > 0 ? Container(
      height: 80,
      child: ListView.builder(
        itemCount: _order.evaluations.length,
        itemBuilder: (context, index) {
          final Evaluation evaluation = _order.evaluations[index];
          return _buildEvaluationItem(evaluation, context);
        },
      ),
    ) : Container(
      margin: EdgeInsets.only(top: 20),
      width: (MediaQuery.of(context).size.width - 8),
      child: ElevatedButton(
        child: Text('Avaliar Pedido'),
        onPressed: () {
          Navigator.pushNamed(context, '/evaluation-order');
        },
        style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor, onPrimary: Colors.white, elevation: 4, shadowColor: Colors.black),
      ),
    );
  }

  Widget _buildEvaluationItem(Evaluation evaluation, context)
  {
    var onRatingUpdate2 = null;

    return Card(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.grey.shade100),
                borderRadius: BorderRadius.all(Radius.circular(4))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RatingBar.builder(
                      initialRating: evaluation.stars,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                  ),
                  Text("${evaluation.user.name} - ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  Text(evaluation.comment, style: TextStyle(color: Colors.black),)  
                ],
              ),
            ),
          );
  }
}