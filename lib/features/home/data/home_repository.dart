import 'package:my_store_app/features/home/data/category_model.dart';
import 'package:my_store_app/features/products/data/product_model.dart';
import 'home_remote_data_source.dart';

class HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepository({required this.remoteDataSource});

  Future<List<CategoryModel>> getCategories() async {
    final response = await remoteDataSource.getCategories();
    List<CategoryModel> categories = [];
    final data = response.data is List
        ? response.data
        : response.data['data'] ?? [];
    for (var item in data) {
      categories.add(CategoryModel.fromJson(item));
    }
    return categories;
  }

  Future<List<ProductModel>> getPopularDeals() async {
    final response = await remoteDataSource.getPopularDeals();
    List<ProductModel> products = [];
    final data = response.data is List
        ? response.data
        : response.data['data'] ?? [];
    for (var item in data) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }
}
