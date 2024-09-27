// lib/src/di/AppModule.dart
import 'package:demo_view_shopify/src/data/dataSource/local/SharedPref.dart';
import 'package:demo_view_shopify/src/data/dataSource/remote/services/AuthServices.dart';
import 'package:demo_view_shopify/src/data/repository/AuthRepositoryImpl.dart';
import 'package:demo_view_shopify/src/domain/models/AuthResponse.dart';
import 'package:demo_view_shopify/src/domain/repository/AuthRepository.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  //SHARED PREFERENCES
  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  Future<String> get token async {
    String token = "";
    final userSession = await sharedPref.read('user');
    if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
    }
    return token;
  }

  //SERVICE AUTH
  @injectable
  AuthServices get authServices => AuthServices();

  //SERVICE REPOSITORY
  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authServices, sharedPref);

  //USECASES AUTH
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCase(authRepository),
      getUserSession: GetUserSessionUseCase(authRepository),
      saveUserSession: SaveUserSessionUseCase(authRepository));
}
