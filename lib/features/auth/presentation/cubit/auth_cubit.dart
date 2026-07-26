import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  void login(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepository.login(email, password);
      emit(AuthSuccess("تم تسجيل الدخول بنجاح"));
    } catch (e) {
      if (e is DioException) {
        final errorMsg = e.response?.data.toString() ?? e.toString();
        emit(AuthError(errorMsg));
      } else {
        emit(AuthError(e.toString()));
      }
    }
  }

  void signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    emit(AuthLoading());
    try {
      await authRepository.signUp(firstName, lastName, email, password);
      emit(AuthSuccess("تم إنشاء الحساب، يرجى تفعيل البريد"));
    } catch (e) {
      if (e is DioException) {
        final errorMsg = e.response?.data.toString() ?? e.toString();
        emit(AuthError(errorMsg));
      } else {
        emit(AuthError(e.toString()));
      }
    }
  }

  void verifyEmail(String email, String code) async {
    emit(AuthLoading());
    try {
      await authRepository.verifyEmail(email, code);
      emit(AuthSuccess("تم تفعيل الحساب بنجاح"));
    } catch (e) {
      if (e is DioException) {
        final errorMsg = e.response?.data.toString() ?? e.toString();
        emit(AuthError(errorMsg));
      } else {
        emit(AuthError(e.toString()));
      }
    }
  }
}
