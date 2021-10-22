import 'package:flutter/material.dart';

class HeadAuth extends StatelessWidget {
  const HeadAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/IconeFlutterFood.png'),
          fit: BoxFit.fill
        )
      ),
    );
  }
}