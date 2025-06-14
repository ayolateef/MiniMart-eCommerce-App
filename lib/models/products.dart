class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final bool inStock;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.inStock = true,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      description: json['description'],
      inStock: json['inStock'] ?? true,
    );
  }
}