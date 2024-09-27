// lib/src/presentation/pages/auth/login/bloc/RegisterState.dart
import 'package:demo_view_shopify/src/domain/models/User.dart';
import 'package:demo_view_shopify/src/domain/utils/Resource.dart';
import 'package:demo_view_shopify/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RegisterState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final BlocFormItem repassword;
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem phone;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  const RegisterState(
      {this.email = const BlocFormItem(error: 'Ingresa Email'),
      this.password = const BlocFormItem(error: 'Ingresa Contraseña'),
      this.repassword = const BlocFormItem(error: 'Repite la Contraseña'),
      this.name = const BlocFormItem(error: 'Ingresa tu name'),
      this.lastname = const BlocFormItem(error: 'Ingresa tu Apellido'),
      this.phone = const BlocFormItem(error: 'Ingresa tu Teléfono'),
      this.formKey,
      this.response});

  toUser() =>
      User(name: name.value, lastname: lastname.value, phone: phone.value);

  RegisterState copyWith(
      {BlocFormItem? email,
      password,
      repassword,
      name,
      lastname,
      phone,
      Resource? response,
      GlobalKey<FormState>? formKey}) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      repassword: repassword ?? this.repassword,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props =>
      [email, password, repassword, name, lastname, phone, response];
}
