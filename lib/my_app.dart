import 'package:flutter/material.dart';
import 'package:template_bloc_injectable_with_get_it/src/configs/injector/injection.dart';
import 'package:template_bloc_injectable_with_get_it/src/feature/testing/counter/cubit/counter_cubit.dart';
import 'package:template_bloc_injectable_with_get_it/src/feature/testing/presentation/pages/qtesting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CounterCubit>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterTesting(),
      ),
    );
  }
}

