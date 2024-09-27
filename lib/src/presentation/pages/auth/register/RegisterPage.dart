// lib/src/presentation/pages/auth/register/RegisterPage.dart
import 'package:demo_view_shopify/src/domain/models/AuthResponse.dart';
import 'package:demo_view_shopify/src/domain/utils/Resource.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/RegisterContent.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc? _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<RegisterBloc>(context);

    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Error) {
            Fluttertoast.showToast(
                msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          } else if (responseState is Success) {
            final authResponse = responseState.data as AuthResponse;
            _bloc?.add(RegisterSaveSession(authResponse: authResponse));
            Fluttertoast.showToast(
                msg: 'Registro exitoso', toastLength: Toast.LENGTH_LONG);
            // Navegar a la siguiente pantalla después del registro exitoso
            Navigator.pushNamedAndRemoveUntil(
                context, 'client/home', (route) => false);
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Stack(
                children: [
                  RegisterContent(_bloc, state),
                  Center(child: CircularProgressIndicator())
                ],
              );
            }
            return RegisterContent(_bloc, state);
          },
        ),
      ),
    );
  }
}