import 'package:my_store_app/features/home/data/category_model.dart';
import 'package:my_store_app/features/products/data/product_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CategoryModel> categories;
  final List<ProductModel> products;

  HomeLoaded(this.categories, this.products);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
