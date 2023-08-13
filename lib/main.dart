import 'package:flutter/material.dart';
import 'package:template_bloc_injectable_with_get_it/src/configs/injector/injection.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}
