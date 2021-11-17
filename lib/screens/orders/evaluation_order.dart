import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodpark/widgets/bottom_navigator.dart';

class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliar o Pedido'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreenEvaluationOrder(context),
      bottomNavigationBar: BottomNavigator(1),
    );
  }

  Widget _buildScreenEvaluationOrder(context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _buildHeader(),
          Container(height: 20,),
          _buildFormEvaluation(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      child: Text(
        "Avaliar o Pedido: 32165",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget _buildFormEvaluation(context) {
    return Container(
      child: Column(
        children: <Widget>[
          RatingBar.builder(
            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 25,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Container(height: 16,),
          TextFormField(
            autocorrect: true,
            style: TextStyle(color: Theme.of(context).primaryColor),
            cursorColor: Theme.of(context).primaryColor,
            onSaved: (value) {
              print(value);
            },
            decoration: InputDecoration(
                labelText: 'Sua avaliação (ex: muito bom!!!)',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor))),
          ),
          Container(height: 16,),
          Container(
            //margin: EdgeInsets.only(top: 20),
            width: (MediaQuery.of(context).size.width - 8),
            child: ElevatedButton(
              child: Text('Avaliar Pedido', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
              onPressed: () {
                print('avaliar pedido');
              },
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                  elevation: 4,
                  shadowColor: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
