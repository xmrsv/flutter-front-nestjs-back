// lib/src/presentation/pages/blocProviders.dart
import 'package:demo_view_shopify/Injection.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/client/home/bloc/ClientHomeBloc.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterBloc.dart'; // Importa RegisterBloc
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(locator<AuthUseCases>())..add(InitEvent())),
  BlocProvider<RegisterBloc>(
      create: (context) =>
          RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  BlocProvider<ClientHomeBloc>(
      create: (context) => ClientHomeBloc(locator<AuthUseCases>()))
];
