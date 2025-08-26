class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  final String description;
  final int quantity;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    this.quantity = 1,
  });

  Product copyWith({
    int? id,
    String? title,
    String? image,
    double? price,
    String? description,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "image": image,
      "price": price,
      "description": description,
      "quantity": quantity,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"] ?? '',
    image: (json["image"] as String).trim().contains(' ')
        ? 'https://ecobrush.com.mx/img/productos/0.png'
        : json["image"],
    price: (json["price"] as num).toDouble(),
    description: json["description"] ?? '',
    quantity: json["quantity"] ?? 1,
  );

  factory Product.fromMap(Map<String, dynamic> map) => Product(
    id: map["id"],
    title: map["title"],
    image: map["image"],
    price: map["price"],
    description: map["description"],
    quantity: map["quantity"] ?? 1,
  );
}
