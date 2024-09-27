// lib/src/presentation/pages/auth/login/bloc/RegisterEvent.dart
import 'package:demo_view_shopify/src/domain/models/AuthResponse.dart';
import 'package:demo_view_shopify/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterInitEvent extends RegisterEvent {
  const RegisterInitEvent();
}

class NameChanged extends RegisterEvent {
  final BlocFormItem name;
  const NameChanged({required this.name});

  @override
  List<Object?> get props => [name];
}

class LastnameChanged extends RegisterEvent {
  final BlocFormItem lastname;
  const LastnameChanged({required this.lastname});

  @override
  List<Object?> get props => [lastname];
}

class EmailChanged extends RegisterEvent {
  final BlocFormItem email;
  const EmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class PhoneChanged extends RegisterEvent {
  final BlocFormItem phone;
  const PhoneChanged({required this.phone});

  @override
  List<Object?> get props => [phone];
}

class PasswordChanged extends RegisterEvent {
  final BlocFormItem password;
  const PasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

class RepeatPasswordChanged extends RegisterEvent {
  final BlocFormItem repassword;
  const RepeatPasswordChanged({required this.repassword});

  @override
  List<Object?> get props => [repassword];
}

class RegisterSubmit extends RegisterEvent {
  const RegisterSubmit();
}

class RegisterSaveSession extends RegisterEvent {
  final AuthResponse authResponse;
  const RegisterSaveSession({required this.authResponse});

  @override
  List<Object?> get props => [authResponse];
}

class RegisterFormReset extends RegisterEvent {
  const RegisterFormReset();
}
