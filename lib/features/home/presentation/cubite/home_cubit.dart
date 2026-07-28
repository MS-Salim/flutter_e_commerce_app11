import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:my_store_app/features/home/data/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;

  HomeCubit({required this.homeRepository}) : super(HomeInitial());

  void getHomeData() async {
    emit(HomeLoading());
    try {
      final categories = await homeRepository.getCategories();
      final products = await homeRepository.getPopularDeals();
      emit(HomeLoaded(categories, products));
    } catch (e) {
      if (e is DioException) {
        final errorMsg = e.response?.data.toString() ?? e.toString();
        emit(HomeError(errorMsg));
      } else {
        emit(HomeError(e.toString()));
      }
    }
  }
}
