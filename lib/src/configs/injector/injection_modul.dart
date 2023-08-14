import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dioInstance => Dio(); // Menghasilkan instance Dio sebagai singleton
}
