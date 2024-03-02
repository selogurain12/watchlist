import 'package:dio/dio.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';

abstract class SearchMovieState {
  final List<SearchMovieResponseEntity>? searchmovie;
  final DioException? error;

  const SearchMovieState({
    this.error,
    this.searchmovie,
  });
}

class SearchMovieLoading extends SearchMovieState {
  const SearchMovieLoading();
}

class SearchMovieLoaded extends SearchMovieState {
  const SearchMovieLoaded({List<SearchMovieResponseEntity>? searchmovie}) : super(searchmovie: searchmovie);
}

class SearchMovieError extends SearchMovieState {
  const SearchMovieError(DioException? error) : super(error: error);
}