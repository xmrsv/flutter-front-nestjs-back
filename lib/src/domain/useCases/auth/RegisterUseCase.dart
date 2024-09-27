// lib/src/domain/useCases/auth/RegisterUseCase.dart
import 'package:demo_view_shopify/src/domain/models/User.dart';
import 'package:demo_view_shopify/src/domain/repository/AuthRepository.dart';

class RegisterUseCase {
  AuthRepository repository;
  RegisterUseCase(this.repository);
  run(User user) => repository.register(user);
}
