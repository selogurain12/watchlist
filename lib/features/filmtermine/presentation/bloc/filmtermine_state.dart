import 'package:dio/dio.dart';
import 'package:whashlist/features/filmtermine/domain/entities/filmtermine_entity.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';

abstract class FilmTermineState {
  final FilmTermineResponseEntity? createfilmtermine;
  final List<SearchMovieResponseEntity>? listfilmtermine;
  final void deletefilmtermine;
  final DioException? error;

  const FilmTermineState({
    this.error,
    this.createfilmtermine,
    this.listfilmtermine,
    this.deletefilmtermine,
  });
}

class FilmTermineLoading extends FilmTermineState {
  const FilmTermineLoading();
}

class CreateFilmTermineLoaded extends FilmTermineState {
  const CreateFilmTermineLoaded({FilmTermineResponseEntity? createfilmtermine}) : super(createfilmtermine: createfilmtermine);
}

class DeleteFilmTermineLoaded extends FilmTermineState {
  const DeleteFilmTermineLoaded() : super();
}

class ListFilmTermineLoaded extends FilmTermineState {
  const ListFilmTermineLoaded(
      {List<SearchMovieResponseEntity>? listfilmtermine})
      : super(listfilmtermine: listfilmtermine);
}

class FilmTermineError extends FilmTermineState {
  const FilmTermineError(DioException? error) : super(error: error);
}

class DeleteFilmTermineError extends FilmTermineState {
  const DeleteFilmTermineError(DioException? error) : super(error: error);
}

class CreateFilmTermineError extends FilmTermineState {
  const CreateFilmTermineError(DioException? error) : super(error: error);
}

class ListFilmTermineError extends FilmTermineState {
  const ListFilmTermineError(DioException? error) : super(error: error);
}