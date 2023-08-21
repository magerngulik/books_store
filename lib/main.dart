import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_bloc_injectable_with_get_it/src/configs/injector/injection.dart';
import 'package:template_bloc_injectable_with_get_it/src/core/observers/simple_observer.dart';

import 'my_app.dart';

void main() {
  Bloc.observer = SimpleBloc();
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}
