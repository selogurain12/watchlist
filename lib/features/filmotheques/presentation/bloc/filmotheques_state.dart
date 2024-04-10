import 'package:dio/dio.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';

abstract class FilmothequesState {
  final List<FilmothequesResponseEntity>? filmotheques;
  final FilmothequesResponseEntity? addfilmotheque;
  final FilmFilmothequeResponseEntity? addmovie;
  final List<SearchMovieResponseEntity>? filmothequemovie;
  final FilmothequesResponseEntity? renamefilmotheque;
  final void deletefilmotheque;
  final void deletemoviefilmotheque;
  final DioException? error;

  const FilmothequesState(
      {this.error,
      this.filmotheques,
      this.addfilmotheque,
      this.addmovie,
      this.filmothequemovie,
      this.renamefilmotheque,
      this.deletemoviefilmotheque,
      this.deletefilmotheque});
}

class FilmothequesLoading extends FilmothequesState {
  const FilmothequesLoading();
}

class FilmothequesLoaded extends FilmothequesState {
  const FilmothequesLoaded({List<FilmothequesResponseEntity>? filmotheques})
      : super(filmotheques: filmotheques);
}

class FilmFilmothequeLoaded extends FilmothequesState {
  const FilmFilmothequeLoaded({FilmFilmothequeResponseEntity? addmovie})
      : super(addmovie: addmovie);
}

class AddFilmothequeLoaded extends FilmothequesState {
  const AddFilmothequeLoaded({FilmothequesResponseEntity? addfilmotheque})
      : super(addfilmotheque: addfilmotheque);
}

class RenameFilmothequeLoaded extends FilmothequesState {
  const RenameFilmothequeLoaded({FilmothequesResponseEntity? renamefilmotheque})
      : super(renamefilmotheque: renamefilmotheque);
}

class ListFilmFilmothequeLoaded extends FilmothequesState {
  const ListFilmFilmothequeLoaded(
      {List<SearchMovieResponseEntity>? filmothequemovie})
      : super(filmothequemovie: filmothequemovie);
}

class DeleteFilmothequeLoaded extends FilmothequesState {
  const DeleteFilmothequeLoaded() : super();
}

class DeleteMovieFilmothequeLoaded extends FilmothequesState {
  const DeleteMovieFilmothequeLoaded() : super();
}

class FilmothequesError extends FilmothequesState {
  const FilmothequesError(DioException? error) : super(error: error);
}

class FilmFilmothequeError extends FilmothequesState {
  const FilmFilmothequeError(DioException? error) : super(error: error);
}

class ListFilmFilmothequeError extends FilmothequesState {
  const ListFilmFilmothequeError(DioException? error) : super(error: error);
}

class RenameFilmothequeError extends FilmothequesState {
  const RenameFilmothequeError(DioException? error) : super(error: error);
}

class DeleteFilmothequeError extends FilmothequesState {
  const DeleteFilmothequeError(DioException? error) : super(error: error);
}

class DeleteMovieFilmothequeError extends FilmothequesState {
  const DeleteMovieFilmothequeError(DioException? error) : super(error: error);
}
