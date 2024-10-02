import 'package:demo_view_shopify/src/domain/repository/AuthRepository.dart';

class LogoutUseCase {
  AuthRepository repository;
  LogoutUseCase(this.repository);
  run() => repository.logout();
}
