import 'dart:convert';

class CategoryProduct {

  String identify;
  String name;
  String description;

  CategoryProduct({
    required this.identify,
    required this.name,
    required this.description,
  });

  factory CategoryProduct.fromJson(jsonData) {
    return CategoryProduct(
      identify: jsonData['identify'],
      name: jsonData['name'],
      description: jsonData['description'],
    );
  }

  toJson() {
    return jsonEncode({
      'identify': identify,
      'name': name,
      'description': description
    });
  }
}