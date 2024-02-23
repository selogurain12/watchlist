import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/book/domain/usecases/searchbook.dart';
import 'package:whashlist/features/book/presentation/bloc/book_event.dart';
import 'package:whashlist/features/book/presentation/bloc/book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final SearchBookUseCase searchBookUseCase;

  BookBloc(
    this.searchBookUseCase,
  ) : super(const BookLoading()) {
    on<SearchBookEvent>(searchbook);
  }

  void searchbook(SearchBookEvent event, Emitter<BookState> emit) async {
    final data = await searchBookUseCase(
      params: ApiBookRequestEntity(
        q: event.q,
      ),
    );

    if (data is DataSuccess) {
      emit(BookLoaded(searchbook: data.data));
    }

    if (data is DataFailure) {
      emit(BookError(data.error));
    }
  }
}