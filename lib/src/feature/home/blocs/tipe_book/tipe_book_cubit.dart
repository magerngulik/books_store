import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:template_bloc_injectable_with_get_it/src/feature/home/data/books_repository.dart';

import '../../../../configs/injector/injection.dart';

part 'tipe_book_state.dart';
part 'tipe_book_cubit.freezed.dart';

@injectable
class TipeBookCubit extends Cubit<TipeBookState> {
  TipeBookCubit() : super(const TipeBookState.initial());

  getData() async {
    emit(const TipeBookState.loading());
    var repo = BooksRepository(dio: getIt<Dio>());
    var data = await repo.getTypeBook();
    data.fold((l) {
      emit(TipeBookState.failed(message: l));
    }, (r) {
      var meta = r;
      String selected = meta.first['name'];
      emit(TipeBookState.success(data: r, selected: selected));
    });
  }

  void changeSelected({required String newSelected}) {
    // Menggunakan 'state' saat ini sebagai titik awal untuk memperbarui nilai.
    state.maybeWhen(
      success: (data, selected) {
        // Jika state adalah 'TipeBookState.success', maka perbarui nilai 'selected'.
        final updatedState =
            TipeBookState.success(data: data, selected: newSelected);

        // Memanggil 'emit' dengan state yang baru.
        emit(updatedState);
      },
      orElse: () {
        // Tindakan lain jika state tidak berupa 'TipeBookState.success'.
      },
    );
  }
}
