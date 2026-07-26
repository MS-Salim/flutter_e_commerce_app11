import 'package:fpdart/fpdart.dart';
import '../../data/product_model.dart';
import '../datasources/products_remote_data_source.dart';

abstract class ProductsRepository {
  Future<Either<String, List<ProductModel>>> getProducts();
}

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();
      return Right(products);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
