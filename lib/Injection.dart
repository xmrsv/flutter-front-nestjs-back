// lib/Injection.dart
import 'package:demo_view_shopify/Injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencias() async => await locator.init();
