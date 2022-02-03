import 'package:flutter/material.dart';

import 'dart:convert';

import './Product.dart';
import './Evaluation.dart';

class Order {

  String identify;
  String date;
  String status;
  double total;
  String comment;
  List<Product> products;
  List<Evaluation> evaluations;

  Order({
    required this.identify,
    required this.date,
    required this.status,
    required this.total,
    required this.comment,
    required this.products,
    required this.evaluations
  });

  factory Order.fromJson(jsonData) {
    List<Product> _productsApi = (jsonData['products'] as List)
                                  .map((product) => Product.fromJson(product))
                                  .toList();

    List<Evaluation> _evaluationsApi = (jsonData['evaluations'] as List)
                                  .map((evaluation) => Evaluation.fromJson(evaluation))
                                  .toList();
    return Order(
      identify: jsonData['identify'],
      date: jsonData['date'],
      status: jsonData['status'],
      total: double.parse(jsonData['total'].toString()),
      comment: jsonData['comment'],
      products: _productsApi,
      evaluations: _evaluationsApi,
    );
  }

  toJson() {
    return jsonEncode({
      'identify': identify,
      'date': date,
      'status': status,
      'total': total,
      'comment': comment,
      'products': products,
      'evaluations': evaluations
    });
  }
}