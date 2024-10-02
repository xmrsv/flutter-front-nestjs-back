// lib/src/presentation/pages/auth/register/bloc/RegisterBloc.dart
import 'package:demo_view_shopify/src/domain/models/AuthResponse.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:demo_view_shopify/src/domain/utils/Resource.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:demo_view_shopify/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthUseCases authUseCases;

  RegisterBloc(this.authUseCases) : super(RegisterState()) {
    on<RegisterInitEvent>(
        _onRegisterInitEvent); // Renombrado a RegisterInitEvent
    on<NameChanged>(_onNameChanged);
    on<LastnameChanged>(_onLastnameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PhoneChanged>(_onPhoneChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<RepeatPasswordChanged>(_onRepeatPasswordChanged);
    on<RegisterSubmit>(_onRegisterSubmit);
    on<RegisterSaveSession>(_onRegisterSaveSession);
    on<RegisterFormReset>(_onRegisterFormReset);
  }
  final formKey = GlobalKey<FormState>();

  Future<void> _onRegisterInitEvent(
      RegisterInitEvent event, Emitter<RegisterState> emit) async {
    // Renombrado a RegisterInitEvent
    AuthResponse? authResponse = await authUseCases.getUserSession.run();
    emit(state.copyWith(formKey: formKey));
    print("usuario en sessio: ${authResponse?.toJson()}");
    if (authResponse != null) {
      emit(state.copyWith(response: Success(authResponse), formKey: formKey));
    }
  }

  Future<void> _onNameChanged(
      NameChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isNotEmpty ? null : 'Ingresa tu nombre'),
        formKey: formKey));
  }

  Future<void> _onLastnameChanged(
      LastnameChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        lastname: BlocFormItem(
            value: event.lastname.value,
            error:
                event.lastname.value.isNotEmpty ? null : 'Ingresa tu apellido'),
        formKey: formKey));
  }

  Future<void> _onEmailChanged(
      EmailChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        email: BlocFormItem(
            value: event.email.value, error: _validarEmail(event.email.value)),
        formKey: formKey));
  }

  Future<void> _onPhoneChanged(
      PhoneChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        phone: BlocFormItem(
            value: event.phone.value,
            error: event.phone.value.isNotEmpty ? null : 'Ingresa tu teléfono'),
        formKey: formKey));
  }

  Future<void> _onPasswordChanged(
      PasswordChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        password: BlocFormItem(
            value: event.password.value,
            error: _validarPassword(event.password.value)),
        formKey: formKey));
  }

  Future<void> _onRepeatPasswordChanged(
      RepeatPasswordChanged event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
        repassword: BlocFormItem(
            value: event.repassword.value,
            error: _validarRepeatPassword(
                event.repassword.value, state.password.value)),
        formKey: formKey));
  }

  Future<void> _onRegisterSubmit(
      RegisterSubmit event, Emitter<RegisterState> emit) async {
    print("entrando register submit");
    emit(
      state.copyWith(response: Loading(), formKey: formKey),
    );
    print("datos:");
    print("name ${state.name.value}");
    print("lastname: ${state.lastname.value}");
    print("email: ${state.email.value}");
    print("phone: ${state.phone.value}");
    print("password: ${state.password.value}");
    print("repassword: ${state.repassword.value}");

    print("llamando authUseCases.register.run....");

    Resource response = await authUseCases.register.run(state.toUser());

    print("llamado! respuesta: ${response}");
    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onRegisterSaveSession(
      RegisterSaveSession event, Emitter<RegisterState> emit) async {
    await authUseCases.saveUserSession.run(event.authResponse);
  }

  Future<void> _onRegisterFormReset(
      RegisterFormReset event, Emitter<RegisterState> emit) async {
    state.formKey?.currentState?.reset();
  }

  String? _validarEmail(String email) {
    print("validando email...");
    if (email.isEmpty) {
      print("email vacio");
      return 'Ingresa tu email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      print("email invalido");
      return 'Email inválido';
    }
    print("email ok");
    return null;
  }

  String? _validarPassword(String password) {
    if (password.isEmpty) {
      return 'Ingresa tu contraseña';
    } else if (password.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  String? _validarRepeatPassword(String repeatPassword, String password) {
    if (repeatPassword.isEmpty) {
      return 'Repite tu contraseña';
    } else if (repeatPassword != password) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }
}
