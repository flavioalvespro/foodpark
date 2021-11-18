import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  int _active_item = 0;

  BottomNavigator(this._active_item);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        index: _active_item,
        height: 45,
        items: <Widget>[
          Icon(Icons.home),
          Icon(Icons.list),
          Icon(Icons.shopping_cart),
          Icon(Icons.supervised_user_circle)
        ],
        onTap: (index) {
          switch (index) {
            case 0:
                Navigator.pushReplacementNamed(context, '/tenants');
              break;
            case 1:
                Navigator.pushReplacementNamed(context, '/orders');
              break;
            case 2:
                Navigator.pushReplacementNamed(context, '/cart');
              break;
            case 3:
                Navigator.pushReplacementNamed(context, '/profile');
              break;
            default:
                Navigator.pushReplacementNamed(context, '/tenants');
          }
        },
      );
  }
}