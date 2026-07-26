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
    List<String> dummyImages = [
      'https://images.unsplash.com/photo-1511499767150-a48a237f0083?q=80&w=800&auto=format&fit=crop', // نظارة
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=800&auto=format&fit=crop', // كوتشي
      'https://images.unsplash.com/photo-1584916201218-f4242ceb4809?q=80&w=800&auto=format&fit=crop', // شنطة
      'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?q=80&w=800&auto=format&fit=crop', // تيشرت
      'https://images.unsplash.com/photo-1524805444758-089113d48a6d?q=80&w=800&auto=format&fit=crop', // ساعة رياضية
      'https://images.unsplash.com/photo-1599643478524-fb66f70d00f0?q=80&w=800&auto=format&fit=crop', // اكسسوارات
    ];

    String productTitle = json['title'] ?? json['name'] ?? 'بدون اسم';

    String selectedImage =
        dummyImages[productTitle.hashCode.abs() % dummyImages.length];

    return ProductModel(
      id: json['id'] ?? '',
      title: productTitle,
      price: json['price'] != null ? (json['price'] as num).toDouble() : 0.0,
      description: json['description'] ?? 'لا يوجد وصف',
      image: selectedImage,
    );
  }
}
