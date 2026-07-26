import 'package:my_store_app/features/products/data/product_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<ProductModel> cartItems;
  final double totalPrice;

  CartUpdated({required this.cartItems, required this.totalPrice});
}
