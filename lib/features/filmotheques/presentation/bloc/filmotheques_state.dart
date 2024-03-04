import 'package:dio/dio.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';

abstract class FilmothequesState {
  final List<FilmothequesResponseEntity>? filmotheques;
  final FilmothequesResponseEntity? addfilmotheque;
  final FilmFilmothequeResponseEntity? addmovie;
  final DioException? error;

  const FilmothequesState({
    this.error,
    this.filmotheques,
    this.addfilmotheque,
    this.addmovie,
  });
}

class FilmothequesLoading extends FilmothequesState {
  const FilmothequesLoading();
}

class FilmothequesLoaded extends FilmothequesState {
  const FilmothequesLoaded({List<FilmothequesResponseEntity>? filmotheques, FilmothequesResponseEntity? addfilmotheque, FilmFilmothequeResponseEntity? addmovie}) : super(filmotheques: filmotheques, addfilmotheque: addfilmotheque, addmovie: addmovie);
}

class FilmothequesError extends FilmothequesState {
  const FilmothequesError(DioException? error) : super(error: error);
}

class FilmFilmothequeError extends FilmothequesState {
  const FilmFilmothequeError(DioException? error) : super(error: error);
}