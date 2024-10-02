// lib/src/domain/useCases/auth/AuthUseCases.dart
import 'package:demo_view_shopify/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/SaveUserSessionUseCase.dart';

class AuthUseCases {
  LoginUseCase login;
  LogoutUseCase logout;
  RegisterUseCase register;
  GetUserSessionUseCase getUserSession;
  SaveUserSessionUseCase saveUserSession;
  AuthUseCases(
      {required this.login,
      required this.logout,
      required this.register,
      required this.getUserSession,
      required this.saveUserSession});
}
