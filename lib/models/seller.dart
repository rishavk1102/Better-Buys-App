class Seller {
  int? id;
  String? name;
  String? email;
  String? image;
  String? address;
  String? description;

  Seller.fromMap(Map<dynamic, dynamic> map) {
    id = int.parse(map['id']);
    name = map['name'];
    email = map['email'];
    image = map['image'];
    address = map['address'];
    description = map['description'];
  }
}
