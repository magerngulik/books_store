part of 'counter_cubit.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState.initial() = _Initial;
  const factory CounterState.success({@Default(0) int data}) = _Success;
  const factory CounterState.failed() = _Failed;
  const factory CounterState.loading() = _Loading;
}
