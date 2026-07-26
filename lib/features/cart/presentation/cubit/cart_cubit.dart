import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store_app/features/products/data/product_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<ProductModel> _cartItems = [];

  void addToCart(ProductModel product) {
    _cartItems.add(product);
    _updateCart();
  }

  void removeFromCart(ProductModel product) {
    _cartItems.remove(product);
    _updateCart();
  }

  void _updateCart() {
    double total = 0.0;
    for (var item in _cartItems) {
      total += (item.price ?? 0).toDouble();
    }
    emit(CartUpdated(cartItems: List.from(_cartItems), totalPrice: total));
  }
}
