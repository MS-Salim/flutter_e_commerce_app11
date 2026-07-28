import 'package:dio/dio.dart';
import 'package:my_store_app/core/api/dio_helper.dart';

abstract class HomeRemoteDataSource {
  Future<Response> getCategories();
  Future<Response> getPopularDeals();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<Response> getCategories() async {
    return await DioHelper.dio.get('api/categories');
  }

  @override
  Future<Response> getPopularDeals() async {
    return await DioHelper.dio.get('api/products');
  }
}
