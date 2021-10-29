import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowImageCached extends StatelessWidget {

  String _image = '';

  ShowImageCached(this._image);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
              //child: Image.asset('assets/images/IconeFlutterFood.png'),
              child: CachedNetworkImage(
                imageUrl: _image,
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
            );
  }
}