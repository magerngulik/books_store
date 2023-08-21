import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:template_bloc_injectable_with_get_it/src/configs/injector/injection.dart';
import 'package:template_bloc_injectable_with_get_it/src/feature/home/data/books_repository.dart';

part 'type_books_state.dart';
part 'type_books_cubit.freezed.dart';

@injectable
class TypeBooksCubit extends Cubit<TypeBooksState> {
  TypeBooksCubit() : super(const TypeBooksState.initial());

  getData() async {
    emit(const TypeBooksState.loading());
    var repo = BooksRepository(dio: getIt<Dio>());
    var data = await repo.getTypeBooks();
    data.fold((l) {
      emit(TypeBooksState.failed(l));
    }, (r) {
      emit(TypeBooksState.success(r));
    });
  }

  changeTypeBooks({required int typeId}) async {
    emit(const TypeBooksState.loading());
    var repo = BooksRepository(dio: getIt<Dio>());
    var data = await repo.getTypeBooks(typeId: typeId);
    data.fold((l) {
      emit(TypeBooksState.failed(l));
    }, (r) {
      emit(TypeBooksState.success(r));
    });
  }
}
