// lib/src/domain/useCases/auth/GetUserSessionUseCase.dart
import 'package:demo_view_shopify/src/domain/repository/AuthRepository.dart';

class GetUserSessionUseCase {
  AuthRepository authRepository;

  GetUserSessionUseCase(this.authRepository);

  run() => authRepository.getUsersSession();
}
