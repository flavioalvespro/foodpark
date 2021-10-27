import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TenantCard extends StatelessWidget {
  final String uuid;
  final String name;
  final String image;
  final String contact;

  const TenantCard(
      {required this.uuid,
      required this.name,
      required this.image,
      required this.contact});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/products');
        },
        child: Card(
          elevation: 2.5,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
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
                  ),
                  VerticalDivider(color: Colors.black54),
                  Expanded(
                      child: Text(name,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold)))
                ],
              ),
            ),
          ),
        ));
  }
}
