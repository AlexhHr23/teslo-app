
import 'package:teslo_app/features/auth/domain/domain.dart';

import '../infrastructure.dart';

class AuthRepositoryImpl extends AuthRepository {

  final AuthDatasource dataSource;

  AuthRepositoryImpl({
    AuthDatasource? dataSource
  }): dataSource = dataSource ?? AuthDatasourceImpl();

  @override
  Future<User> checkAuth(String token) {
    return dataSource.checkAuth(token);
  }

  @override
  Future<User> login(String email, String password) {
    return dataSource.login(email, password);
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    return dataSource.register(email, password, fullName);
  }
}