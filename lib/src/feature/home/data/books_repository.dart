import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BooksRepository {
  Dio dio;
  BooksRepository({
    required this.dio,
  });

  Future<Either<String, List<Map<String, dynamic>>>> getTypeBooks(
      {int? typeId = 2}) async {
    try {
      final response = await dio.get(
        "http://bookstore.test/api/books/type",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {"type_id": typeId},
      );
      Map obj = response.data;
      return Right(List<Map<String, dynamic>>.from(obj['data']));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<Map<String, dynamic>>>> getTypeBook() async {
    try {
      final response = await dio.get(
        "http://bookstore.test/api/type",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      Map obj = response.data;

      return Right(List<Map<String, dynamic>>.from(obj['data']));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
