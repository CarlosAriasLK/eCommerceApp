
class Product {

  final int id;
  final String title;
  final String image;
  final double price;
  final String description;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "image": image,
      "price": price,
      "description": description,
    };
  }

  factory Product.fromJson( Map<String, dynamic> json ) => Product(
    id: json["id"],
    title: json["title"] ?? '',
    image: (json["image"] as String).trim().contains(' ') ? 'https://ecobrush.com.mx/img/productos/0.png' : json["image"],
    price: (json["price"] as num ).toDouble(),
    description: json["description"] ?? ''
  );

  factory Product.fromMap( Map<String, dynamic> map ) => Product(
      id: map["id"],
      title: map["title"],
      image: map["image"],
      price: map["price"],
      description: map["description"]
  );

}