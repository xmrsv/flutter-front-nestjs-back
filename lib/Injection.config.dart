// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:demo_view_shopify/src/data/dataSource/local/SharedPref.dart'
    as _i601;
import 'package:demo_view_shopify/src/data/dataSource/remote/services/AuthServices.dart'
    as _i283;
import 'package:demo_view_shopify/src/di/AppModule.dart' as _i292;
import 'package:demo_view_shopify/src/domain/repository/AuthRepository.dart'
    as _i877;
import 'package:demo_view_shopify/src/domain/useCases/auth/AuthUseCases.dart'
    as _i623;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i601.SharedPref>(() => appModule.sharedPref);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i283.AuthServices>(() => appModule.authServices);
    gh.factory<_i877.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i623.AuthUseCases>(() => appModule.authUseCases);
    return this;
  }
}

class _$AppModule extends _i292.AppModule {}
