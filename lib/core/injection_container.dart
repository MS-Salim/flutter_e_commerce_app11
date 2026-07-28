import 'package:get_it/get_it.dart';
import 'package:my_store_app/features/home/presentation/cubite/home_cubit.dart';
import 'package:my_store_app/features/products/data/datasources/products_remote_data_source.dart';
import 'package:my_store_app/features/products/data/repositories/products_repository.dart';
import 'package:my_store_app/features/products/presentation/cubit/products_cubit.dart';
import '../features/cart/presentation/cubit/cart_cubit.dart';
import '../features/auth/data/auth_remote_data_source.dart';
import '../features/auth/data/auth_repository.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';
import '../features/home/data/home_repository.dart';
import '../features/home/data/home_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AuthCubit(authRepository: sl()));
  sl.registerFactory(() => ProductsCubit(repository: sl()));
  sl.registerFactory(() => CartCubit());
  sl.registerFactory(() => HomeCubit(homeRepository: sl()));

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => HomeRepository(remoteDataSource: sl()));

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
}
