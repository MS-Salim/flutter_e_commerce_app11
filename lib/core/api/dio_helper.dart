import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://accessories-eshop.runasp.net/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({required String url}) async {
    return await dio.get(url);
  }
}
