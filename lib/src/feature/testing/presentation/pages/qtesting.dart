import 'package:flutter/material.dart';
import 'package:template_bloc_injectable_with_get_it/src/feature/testing/counter/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterTesting extends StatelessWidget {
  const CounterTesting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        print(state);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            "Main Screen",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      return const Text(
                        "",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      );
                    },
                    loading: (value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    success: (value) {
                      return Text(
                        value.data.toString(),
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  context.read<CounterCubit>().changeData();
                },
                child: const Text("Change Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
