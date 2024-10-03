

import 'package:teslo_app/features/auth/domain/entities/user.dart';

abstract class AuthDatasource {

  Future<User> login(String email, String password);
  Future<User> register(String email, String password, String fullName);
  Future<User> checkAuth(String token);

}