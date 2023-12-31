import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:template_bloc_injectable_with_get_it/src/configs/injector/injection.config.dart';

import '../../core/api/api_helper.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  getIt.init();
  getIt.registerLazySingleton(
    () => ApiHelper(
      getIt<Dio>(),
    ),
  );
}
