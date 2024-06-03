class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final List<String> images;
  final List<String> colors;
  final int stock;
  final double rating;
  final int reviews;
  final int views;
  final String category;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.colors,
    required this.stock,
    required this.rating,
    required this.reviews,
    required this.views,
    required this.category,
  });
}
