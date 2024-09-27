// lib/src/domain/useCases/auth/LoginUseCase.dart
import 'package:demo_view_shopify/src/domain/repository/AuthRepository.dart';

class LoginUseCase {
  AuthRepository repository;
  LoginUseCase(this.repository);
  run(String email, String password) => repository.login(email, password);
}
