import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodpark/models/Product.dart';

class ProductCard extends StatelessWidget {
  String identify;
  String title;
  String description;
  String price;
  String image;
  bool showIconCart;

  // ignore: non_constant_identifier_names
  ProductCard({
      required this.identify,
      required this.title,
      required this.description,
      required this.price,
      required this.image, 
      required this.showIconCart,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.5,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Container(
            padding: EdgeInsets.all(8),
            color: Colors.white,
            child: Row(children: <Widget>[
              _buildImageProduct(),
              _buildInfoProduct(),
              _buildButtonCart(context)
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoProduct() {
    return Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Container(height: 5),
          Text(
            description,
            style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.normal),
          ),
          Container(height: 7),
          Text(
            "R\$ $price",
            style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          )
        ]));
  }

  Widget _buildImageProduct() {
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.only(right: 8),
      child: ClipOval(
        //child: Image.asset('assets/images/IconeFlutterFood.png'),
        child: CachedNetworkImage(
          imageUrl: image != ''
              ? image
              : 'https://cdn.iconscout.com/icon/free/png-256/restaurant-1495593-1267764.png',
          placeholder: (context, url) => Container(
            height: 80,
            width: 80,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonCart(context) {
    return this.showIconCart ? Container() : Container(
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).primaryColor),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
