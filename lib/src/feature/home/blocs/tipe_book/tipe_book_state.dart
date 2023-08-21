part of 'tipe_book_cubit.dart';

@freezed
class TipeBookState with _$TipeBookState {
  const factory TipeBookState.initial() = _Initial;
  const factory TipeBookState.success(
      {required List<Map<String, dynamic>> data,
      required String selected}) = _Success;
  const factory TipeBookState.failed({required String message}) = _Failed;
  const factory TipeBookState.loading() = _Loading;
}
