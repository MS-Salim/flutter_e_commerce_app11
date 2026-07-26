import 'package:dio/dio.dart';
import '../../../../core/api/dio_helper.dart';
import '../product_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await DioHelper.getData(url: 'api/products');

    if (response.data is List) {
      return (response.data as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else if (response.data is Map) {
      var list =
          response.data['data'] ??
          response.data['products'] ??
          response.data['items'];
      if (list is List) {
        return list.map((e) => ProductModel.fromJson(e)).toList();
      }
    }

    return [];
  }
}
