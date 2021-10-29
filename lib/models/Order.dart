import 'package:flutter/material.dart';

import 'dart:convert';

import './Product.dart';
import './Evaluation.dart';

class Order {

  String identify;
  String date;
  String status;
  String table;
  double total;
  String comment;
  List<Product> products;
  List<Evaluation> evaluations;

  Order({
    required this.identify,
    required this.date,
    required this.status,
    required this.table,
    required this.total,
    required this.comment,
    required this.products,
    required this.evaluations
  });

  factory Order.fromJson(jsonData) {
    return Order(
      identify: jsonData['identify'],
      date: jsonData['date'],
      status: jsonData['status'],
      table: jsonData['table'],
      total: double.parse(jsonData['total']),
      comment: jsonData['commnet'],
      products: jsonData['products'],
      evaluations: jsonData['evaluations'],
    );
  }

  toJson() {
    return jsonEncode({
      'identify': identify,
      'date': date,
      'status': status,
      'table': table,
      'total': total,
      'comment': comment,
      'products': products,
      'evaluations': evaluations
    });
  }
}