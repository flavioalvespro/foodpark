import 'dart:convert';

import 'package:foodpark/models/User.dart';

class Evaluation {

  User user;
  String comment;
  double stars;

  Evaluation({
    required this.user,
    required this.comment,
    required this.stars
  });

  factory Evaluation.fromJson(jsonData) {
    return Evaluation(
      user: User.fromJson(jsonData['client']),
      comment: jsonData['comment'],
      stars: double.parse(jsonData['stars'].toString())
    );
  }

  toJson() {
    return jsonEncode({
      'user': user,
      'comment': comment,
      'stars': stars
    });
  }
}