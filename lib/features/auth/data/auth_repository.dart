import 'auth_remote_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepository({required this.remoteDataSource});

  Future<void> login(String email, String password) async {
    await remoteDataSource.login(email, password);
  }

  Future<void> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    await remoteDataSource.signUp(firstName, lastName, email, password);
  }

  Future<void> verifyEmail(String email, String code) async {
    await remoteDataSource.verifyEmail(email, code);
  }
}
