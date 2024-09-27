// lib/src/presentation/pages/auth/login/bloc/LoginBloc.dart
import 'package:demo_view_shopify/src/domain/models/AuthResponse.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:demo_view_shopify/src/domain/utils/Resource.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:demo_view_shopify/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthUseCases authUseCases;

  LoginBloc(this.authUseCases) : super(LoginState()) {
    on<InitEvent>(_onInitEvent);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmit>(_onLoginSubmit);
    on<LoginSaveSession>(_onLoginSaveUserSession);
    on<LoginFormReset>(_onLoginFormReset);
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(InitEvent event, Emitter<LoginState> emit) async {
    AuthResponse? authResponse = await authUseCases.getUserSession.run();
    emit(state.copyWith(formKey: formKey));
    print("usuario en sessio: ${authResponse?.toJson()}");
    if (authResponse != null) {
      emit(state.copyWith(response: Success(authResponse), formKey: formKey));
    }
  }

  Future<void> _onEmailChanged(
      EmailChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isNotEmpty ? null : 'Ingresa email'),
        formKey: formKey));
  }

  Future<void> _onPasswordChanged(
      PasswordChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        password: BlocFormItem(
            value: event.password.value,
            error:
                event.password.value.isNotEmpty ? null : 'Ingresa el password'),
        formKey: formKey));
  }

  Future<void> _onLoginSubmit(
      LoginSubmit event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(response: Loading(), formKey: formKey),
    );
    await Future.delayed(Duration(seconds: 6));
    Resource response =
        await authUseCases.login.run(state.email.value, state.password.value);
    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onLoginSaveUserSession(
      LoginSaveSession event, Emitter<LoginState> emit) async {
    await authUseCases.saveUserSession.run(event.authResponse);
  }

  Future<void> _onLoginFormReset(
      LoginFormReset event, Emitter<LoginState> emit) async {
    state.formKey?.currentState?.reset();
  }
}
