// lib/main.dart
import 'package:demo_view_shopify/Injection.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/client/category/list/ClientCategoryListPage.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/client/product/list/ClientProductListPage.dart';
import 'package:demo_view_shopify/src/presentation/pages/blocProviders.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/client/home/ClienteHomePage.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await configureDependencias();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
          builder: FToastBuilder(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          initialRoute: 'login',
          routes: {
            'login': (BuildContext context) => LoginPage(),
            'register': (BuildContext context) => RegisterPage(),
            'client/home': (BuildContext context) => ClientHomePage(),
            "client/product/list": (BuildContext context) =>
                ClientProductListPage(),
            "client/category/list": (BuildContext context) =>
                ClientCategoryListPage()
          }),
    );
  }
}
