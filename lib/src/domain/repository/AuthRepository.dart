// lib/src/domain/repository/AuthRepository.dart
import 'package:demo_view_shopify/src/domain/models/AuthResponse.dart';
import 'package:demo_view_shopify/src/domain/models/User.dart';
import 'package:demo_view_shopify/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  //METODOS
  Future<AuthResponse?> getUsersSession();
  Future<bool> logout();
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<AuthResponse>> register(User user);
}
