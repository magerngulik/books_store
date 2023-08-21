// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../feature/home/blocs/tipe_book/tipe_book_cubit.dart' as _i5;
import '../../feature/home/blocs/type/type_books_cubit.dart' as _i6;
import '../../feature/testing/counter/cubit/counter_cubit.dart' as _i3;
import 'injection_modul.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.factory<_i3.CounterCubit>(() => _i3.CounterCubit());
    gh.lazySingleton<_i4.Dio>(() => injectableModule.dioInstance);
    gh.factory<_i5.TipeBookCubit>(() => _i5.TipeBookCubit());
    gh.factory<_i6.TypeBooksCubit>(() => _i6.TypeBooksCubit());
    return this;
  }
}

class _$InjectableModule extends _i7.InjectableModule {}
