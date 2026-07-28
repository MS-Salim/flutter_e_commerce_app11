import 'package:dio/dio.dart';
import '../../../../core/api/dio_helper.dart';

abstract class AuthRemoteDataSource {
  Future<String> login(String email, String password);
  Future<Response> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  );
  Future<Response> verifyEmail(String email, String code);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<String> login(String email, String password) async {
    try {
      final response = await DioHelper.dio.post(
        'api/auth/login',
        data: {'email': email, 'password': password},
      );

      print('=== API RESPONSE ===: ${response.data}');

      final token = response.data['token'];

      if (token != null) {
        return token.toString();
      } else {
        return '';
      }
    } catch (e) {
      print('=== API ERROR ===: $e');
      throw Exception('Login Failed: $e');
    }
  }

  @override
  Future<Response> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    return await DioHelper.dio.post(
      'api/auth/register',
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      },
    );
  }

  @override
  Future<Response> verifyEmail(String email, String code) async {
    return await DioHelper.dio.post(
      'api/auth/verify-email',
      data: {'email': email, 'otp': code},
    );
  }
}
