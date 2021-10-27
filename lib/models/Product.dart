import 'dart:convert';

class Product {

  String identify;
  String title;
  String description;
  String price;
  String image;

  Product({
    required this.identify,
    required this.title,
    required this.description,
    required this.price,
    required this.image
  });

  factory Product.fromJson(jsonData) {
    return Product(
      identify: jsonData['identify'],
      title: jsonData['title'],
      description: jsonData['description'],
      price: jsonData['price'],
      image: jsonData['image'],
    );
  }

  toJson() {
    return jsonEncode({
      'identify': identify,
      'title': title,
      'description': description,
      'price': price,
      'image': image
    });
  }
}