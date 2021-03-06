import 'dart:convert';

class Tenant {

  String uuid;
  String name;
  String image;
  String contact;

  Tenant({
    required this.uuid,
    required this.name,
    required this.image,
    required this.contact
  });

  factory Tenant.fromJson(jsonData) {
    return Tenant(
      uuid: jsonData['uuid'],
      name: jsonData['name'],
      image: jsonData['image'],
      contact: jsonData['contact'],
    );
  }

  toJson() {
    return jsonEncode({
      'uuid': uuid,
      'name': name,
      'image': image,
      'contact': contact,
    });
  }
}