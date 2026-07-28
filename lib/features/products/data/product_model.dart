class ProductModel {
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    String productTitle = json['title'] ?? json['name'] ?? 'بدون اسم';
    String lowerTitle = productTitle.toLowerCase();

    String safeImage =
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800&q=80';

    if (lowerTitle.contains('glass') || lowerTitle.contains('sunglass')) {
      safeImage =
          'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=800&q=80';
    } else if (lowerTitle.contains('earring') ||
        lowerTitle.contains('necklace') ||
        lowerTitle.contains('gold') ||
        lowerTitle.contains('pearl')) {
      safeImage =
          'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?w=800&q=80';
    } else if (lowerTitle.contains('shirt') ||
        lowerTitle.contains('polo') ||
        lowerTitle.contains('cotton')) {
      safeImage =
          'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800&q=80';
    } else if (lowerTitle.contains('shoe') ||
        lowerTitle.contains('sneaker') ||
        lowerTitle.contains('men') ||
        lowerTitle.contains('balenciaga')) {
      safeImage =
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&q=80';
    } else if (lowerTitle.contains('bag') ||
        lowerTitle.contains('wallet') ||
        lowerTitle.contains('handbag') ||
        lowerTitle.contains('gucci')) {
      safeImage =
          'https://images.unsplash.com/photo-1584916201218-f4242ceb4809?w=800&q=80';
    }

    return ProductModel(
      id: json['id'] ?? '',
      title: productTitle,
      price: json['price'] != null ? (json['price'] as num).toDouble() : 0.0,
      description: json['description'] ?? 'لا يوجد وصف',
      image: safeImage,
    );
  }
}
