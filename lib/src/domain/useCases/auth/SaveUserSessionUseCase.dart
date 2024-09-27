// lib/src/domain/useCases/auth/SaveUserSessionUseCase.dart
import 'package:demo_view_shopify/src/domain/models/AuthResponse.dart';
import 'package:demo_view_shopify/src/domain/repository/AuthRepository.dart';

class SaveUserSessionUseCase {
  AuthRepository authRepository;
  SaveUserSessionUseCase(this.authRepository);
  run(AuthResponse authResponse) =>
      authRepository.saveUserSession(authResponse);
}
