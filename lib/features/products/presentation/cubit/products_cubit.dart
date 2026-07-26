import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store_app/features/products/data/product_model.dart';
import 'package:my_store_app/features/products/data/repositories/products_repository.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository repository;

  ProductsCubit({required this.repository}) : super(ProductsInitial());

  static ProductsCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];

  void getProducts() async {
    emit(ProductsLoading());

    final result = await repository.getProducts();

    result.fold(
      (error) {
        print('Error is: ${error.toString()}');
        emit(ProductsError(error));
      },
      (productsList) {
        products = productsList;
        emit(ProductsLoaded(products));
      },
    );
  }
}
