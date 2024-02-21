import 'package:dio/dio.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';

abstract class BookState {
  final List<ApiBookResponseEntity>? searchbook;
  final DioException? error;

  const BookState({
    this.error,
    this.searchbook,
  });
}

class BookLoading extends BookState {
  const BookLoading();
}

class BookLoaded extends BookState {
  const BookLoaded({List<ApiBookResponseEntity>? searchbook}) : super(searchbook: searchbook);
}

class BookError extends BookState {
  const BookError(DioException? error) : super(error: error);
}