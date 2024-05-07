import 'package:dio/dio.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';

abstract class FilmothequeState {
  final FilmothequeResponseEntity? createfilmotheque;
  final List<FilmothequeResponseEntity>? listfilmotheque;
  final List<SearchMovieResponseEntity>? listmovie;
  final FilmothequeResponseEntity? modifiefilmotheque;
  final FilmothequeResponseEntity? deletemovie;
  final FilmothequeResponseEntity? deleteuserinfilmotheque;
  final void deletefilmotheque;
  final DioException? error;

  const FilmothequeState({
    this.error,
    this.createfilmotheque,
    this.listfilmotheque,
    this.listmovie,
    this.modifiefilmotheque,
    this.deletemovie,
    this.deleteuserinfilmotheque,
    this.deletefilmotheque,
  });
}

class FilmothequeLoading extends FilmothequeState {
  const FilmothequeLoading();
}

class DeleteMovieLoaded extends FilmothequeState {
  const DeleteMovieLoaded({FilmothequeResponseEntity? deletemovie }) : super(deletemovie: deletemovie );
}

class CreateFilmothequeLoaded extends FilmothequeState {
  const CreateFilmothequeLoaded({FilmothequeResponseEntity? createfilmotheque}) : super(createfilmotheque: createfilmotheque);
}

class DeleteUserinFilmothequeLoaded extends FilmothequeState {
  const DeleteUserinFilmothequeLoaded({FilmothequeResponseEntity? deleteuserinfilmotheque}) : super(deleteuserinfilmotheque: deleteuserinfilmotheque);
}

class DeleteFilmothequeLoaded extends FilmothequeState {
  const DeleteFilmothequeLoaded() : super();
}

class ListFilmothequeLoaded extends FilmothequeState {
  const ListFilmothequeLoaded(
      {List<FilmothequeResponseEntity>? listfilmotheque})
      : super(listfilmotheque: listfilmotheque);
}

class ListFilmLoaded extends FilmothequeState {
  const ListFilmLoaded({List<SearchMovieResponseEntity>? listmovie}) : super(listmovie: listmovie);
}

class ModifieFilmothequeLoaded extends FilmothequeState {
  const ModifieFilmothequeLoaded({FilmothequeResponseEntity? modifiefilmotheque}) : super(modifiefilmotheque: modifiefilmotheque);
}

class FilmothequeError extends FilmothequeState {
  const FilmothequeError(DioException? error) : super(error: error);
}

class DeleteFilmError extends FilmothequeState {
  const DeleteFilmError(DioException? error) : super(error: error);
}

class CreateFilmothequeError extends FilmothequeState {
  const CreateFilmothequeError(DioException? error) : super(error: error);
}

class DeleteUserinFilmothequeError extends FilmothequeState {
  const DeleteUserinFilmothequeError(DioException? error) : super(error: error);
}

class DeleteFilmothequeError extends FilmothequeState {
  const DeleteFilmothequeError(DioException? error) : super(error: error);
}

class ListFilmothequeError extends FilmothequeState {
  const ListFilmothequeError(DioException? error) : super(error: error);
}

class ListFilmError extends FilmothequeState {
  const ListFilmError(DioException? error) : super(error: error);
}

class ModifieFilmothequeError extends FilmothequeState {
  const ModifieFilmothequeError(DioException? error) : super(error: error);
}
