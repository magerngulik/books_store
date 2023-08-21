part of 'type_books_cubit.dart';

@freezed
class TypeBooksState with _$TypeBooksState {
  const factory TypeBooksState.initial() = _Initial;
  const factory TypeBooksState.loading() = _Loading;
  const factory TypeBooksState.success(List<Map<String, dynamic>> data) =
      _Sucess;
  const factory TypeBooksState.failed(String message) = _Failed;
}
