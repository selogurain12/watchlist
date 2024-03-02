import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';
import 'package:whashlist/features/movie/domain/usecases/searchmovie.dart';
import 'package:whashlist/features/movie/presentation/bloc/searchmovie_event.dart';
import 'package:whashlist/features/movie/presentation/bloc/searchmovie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovieUseCase searchMovieUseCase;

  SearchMovieBloc(
    this.searchMovieUseCase,
  ) : super(const SearchMovieLoading()) {
    on<SearchMoviesEvent>(searchmovie);
  }

  void searchmovie(SearchMoviesEvent event, Emitter<SearchMovieState> emit) async {
    emit(const SearchMovieLoading());
    final data = await searchMovieUseCase(
      params: SearchMovieRequestEntity(
        query: event.query,
      ),
    );

    if (data is DataSuccess) {
      emit(SearchMovieLoaded(searchmovie: data.data));
    }

    if (data is DataFailure) {
      emit(SearchMovieError(data.error));
    }
  }
}