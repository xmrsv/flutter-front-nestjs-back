// lib/src/presentation/pages/auth/register/RegisterContent.dart
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:demo_view_shopify/src/presentation/utils/BlocFormItem.dart';
import 'package:demo_view_shopify/src/presentation/widget/DefaultTextField.dart';
import 'package:flutter/material.dart';

class RegisterContent extends StatelessWidget {
  final RegisterBloc? bloc;
  final RegisterState state;

  RegisterContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackground(context),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.80,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.3),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _iconPerson(),
                  _textRegister(),
                  _textFieldName(),
                  _textFieldApellido(),
                  _textFieldEmail(),
                  _textFieldPhone(),
                  _textFieldPassword(),
                  _textFieldRepeatPassword(),
                  _buttonRegister(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background2.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Colors.black54,
      colorBlendMode: BlendMode.darken,
    );
  }

  Widget _iconPerson() {
    return Icon(
      Icons.person,
      color: Colors.white,
      size: 125,
    );
  }

  Widget _textRegister() {
    return Text(
      'REGISTRARSE',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Name',
        icon: Icons.person,
        onChange: (text) {
          bloc?.add(NameChanged(name: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.name.error;
        },
      ),
    );
  }

  Widget _textFieldApellido() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Apellido',
        icon: Icons.percent_outlined,
        onChange: (text) {
          bloc?.add(LastnameChanged(lastname: BlocFormItem(value: text)));
        },
        obscureText: false,
        validator: (value) {
          return state.lastname.error;
        },
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Email',
        icon: Icons.email,
        onChange: (text) {
          bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.email.error;
        },
      ),
    );
  }

  Widget _textFieldPhone() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Teléfono',
        icon: Icons.phone,
        onChange: (text) {
          bloc?.add(PhoneChanged(phone: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.phone.error;
        },
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Contraseña',
        icon: Icons.lock,
        onChange: (text) {
          bloc?.add(PasswordChanged(password: BlocFormItem(value: text)));
        },
        obscureText: true,
        validator: (value) {
          return state.password.error;
        },
      ),
    );
  }

  Widget _textFieldRepeatPassword() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Repetir Contraseña',
        icon: Icons.lock_outline,
        onChange: (text) {
          bloc?.add(RepeatPasswordChanged(repassword: BlocFormItem(value: text)));
        },
        obscureText: true,
        validator: (value) {
          return state.repassword.error;
        },
      ),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
      child: ElevatedButton(
          onPressed: () {
            if (state.formKey!.currentState!.validate()) {
              bloc!.add(RegisterSubmit());
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: Text(
            'Registrarse',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}