import 'package:dio/dio.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';

abstract class FilmothequesState {
  final List<FilmothequesResponseEntity>? filmotheques;
  final DioException? error;

  const FilmothequesState({
    this.error,
    this.filmotheques,
  });
}

class FilmothequesLoading extends FilmothequesState {
  const FilmothequesLoading();
}

class FilmothequesLoaded extends FilmothequesState {
  const FilmothequesLoaded({List<FilmothequesResponseEntity>? filmotheques}) : super(filmotheques: filmotheques);
}

class FilmothequesError extends FilmothequesState {
  const FilmothequesError(DioException? error) : super(error: error);
}