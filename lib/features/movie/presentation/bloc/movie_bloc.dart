import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/movie/domain/entities/movie_entity.dart';
import 'package:whashlist/features/movie/domain/usecases/searchmovie.dart';
import 'package:whashlist/features/movie/presentation/bloc/movie_event.dart';
import 'package:whashlist/features/movie/presentation/bloc/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final SearchMovieUseCase searchMovieUseCase;

  MovieBloc(
    this.searchMovieUseCase,
  ) : super(const MovieLoading()) {
    on<SearchMovieEvent>(searchmovie);
  }

  void searchmovie(SearchMovieEvent event, Emitter<MovieState> emit) async {
    emit(const MovieLoading());
    final data = await searchMovieUseCase(
      params: ApiMovieRequestEntity(
        query: event.query,
      ),
    );

    if (data is DataSuccess) {
      emit(MovieLoaded(searchmovie: data.data));
    }

    if (data is DataFailure) {
      emit(MovieError(data.error));
    }
  }
}