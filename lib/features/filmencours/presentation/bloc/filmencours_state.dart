import 'package:dio/dio.dart';
import 'package:whashlist/features/filmencours/domain/entities/filmencours_entity.dart';

abstract class FilmEnCoursState {
  final FilmEnCoursResponseEntity? createfilmencours;
  final List<AllFilmEnCoursResponseEntity>? listfilmencours;
  final FilmEnCoursResponseEntity? filmencours;
  final FilmEnCoursResponseEntity? updatefilmencours;
  final void deletefilmencours;
  final DioException? error;

  const FilmEnCoursState({
    this.error,
    this.createfilmencours,
    this.listfilmencours,
    this.updatefilmencours,
    this.filmencours,
    this.deletefilmencours,
  });
}

class FilmEnCoursLoading extends FilmEnCoursState {
  const FilmEnCoursLoading();
}

class CreateFilmEnCoursLoaded extends FilmEnCoursState {
  const CreateFilmEnCoursLoaded(
      {FilmEnCoursResponseEntity? createfilmencours})
      : super(createfilmencours: createfilmencours);
}

class DeleteFilmEnCoursLoaded extends FilmEnCoursState {
  const DeleteFilmEnCoursLoaded() : super();
}

class ListFilmEnCoursLoaded extends FilmEnCoursState {
  const ListFilmEnCoursLoaded({List<AllFilmEnCoursResponseEntity>? listfilmencours})
      : super(listfilmencours: listfilmencours);
}

class FilmEnCoursLoaded extends FilmEnCoursState {
  const FilmEnCoursLoaded({FilmEnCoursResponseEntity? filmencours})
      : super(filmencours: filmencours);
}

class UpdateFilmEnCoursLoaded extends FilmEnCoursState {
  const UpdateFilmEnCoursLoaded(
      {FilmEnCoursResponseEntity? updatefilmencours})
      : super(updatefilmencours: updatefilmencours);
}

class FilmEnCoursError extends FilmEnCoursState {
  const FilmEnCoursError(DioException? error) : super(error: error);
}

class DeleteFilmEnCoursError extends FilmEnCoursState {
  const DeleteFilmEnCoursError(DioException? error) : super(error: error);
}

class CreateFilmEnCoursError extends FilmEnCoursState {
  const CreateFilmEnCoursError(DioException? error) : super(error: error);
}

class ListFilmEnCoursError extends FilmEnCoursState {
  const ListFilmEnCoursError(DioException? error) : super(error: error);
}

class FilmsEnCoursError extends FilmEnCoursState {
  const FilmsEnCoursError(DioException? error) : super(error: error);
}

class UpdateFilmEnCoursError extends FilmEnCoursState {
  const UpdateFilmEnCoursError(DioException? error) : super(error: error);
}
