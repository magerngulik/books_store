import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:template_bloc_injectable_with_get_it/src/configs/injector/injection.dart';
import 'package:template_bloc_injectable_with_get_it/src/feature/home/blocs/tipe_book/tipe_book_cubit.dart';
import 'package:template_bloc_injectable_with_get_it/src/feature/home/blocs/type/type_books_cubit.dart';
import 'package:template_bloc_injectable_with_get_it/src/feature/home/pages/categories_pages.dart';
import 'package:template_bloc_injectable_with_get_it/src/feature/testing/counter/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CounterCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<TypeBooksCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<TipeBookCubit>(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Categories_Pages(),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
