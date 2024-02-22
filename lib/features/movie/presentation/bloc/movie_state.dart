import 'package:dio/dio.dart';
import 'package:whashlist/features/movie/domain/entities/movie_entity.dart';

abstract class MovieState {
  final List<ApiMovieResponseEntity>? searchmovie;
  final DioException? error;

  const MovieState({
    this.error,
    this.searchmovie,
  });
}

class MovieLoading extends MovieState {
  const MovieLoading();
}

class MovieLoaded extends MovieState {
  const MovieLoaded({List<ApiMovieResponseEntity>? searchmovie}) : super(searchmovie: searchmovie);
}

class MovieError extends MovieState {
  const MovieError(DioException? error) : super(error: error);
}