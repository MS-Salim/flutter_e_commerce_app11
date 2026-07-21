import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/dio_helper.dart';
import '../../data/product_model.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  static ProductsCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];

  void getProducts() {
    emit(ProductsLoading());

    DioHelper.getData(url: 'products')
        .then((value) {
          products = (value.data as List)
              .map((e) => ProductModel.fromJson(e))
              .toList();
          emit(ProductsLoaded(products));
        })
        .catchError((error) {
          emit(ProductsError(error.toString()));
        });
  }
}
