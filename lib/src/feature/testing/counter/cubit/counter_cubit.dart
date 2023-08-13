import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'counter_state.dart';
part 'counter_cubit.freezed.dart';

@injectable
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState.initial());

  void changeData() async {
    emit(const CounterState.loading());
    await Future.delayed(const Duration(seconds: 4));
    var newData = Random().nextInt(2000);
    emit(CounterState.success(data: newData));
  }
}
