import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodpark/models/Product.dart';
import 'package:foodpark/stores/products.store.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {

  bool showIconCart;
  Product product;

  // ignore: non_constant_identifier_names
  ProductCard({
      this.showIconCart = false,
      required this.product
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
            product.title,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Container(height: 5),
          Text(
            product.description,
            style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.normal),
          ),
          Container(height: 7),
          Text(
            "R\$ $product.price",
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
          imageUrl: product.image != ''
              ? product.image
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
    final storeProducts = Provider.of<ProductsStore>(context);
    
    return this.showIconCart ? Container() : Container(
      child: IconTheme(
            data: IconThemeData(color: Theme.of(context).primaryColor),
            child: Observer(
              builder: (_) {
                return storeProducts.inProductCart(product) ? GestureDetector(
              onTap: () => storeProducts.removeProductCart(product),
              child: Icon(Icons.remove_shopping_cart),
            ) : GestureDetector(
              onTap: () => storeProducts.addProductCart(product),
              child: Icon(Icons.shopping_cart),
            );
              }
            ),
          ),
    );
  }
}
