import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

abstract class FilmothequesRepository {
  Future<DataState<FilmothequeResponseEntity>> createfilmotheque({
    CreateFilmothequeRequestEntity? body,
  });

  Future<DataState<List<FilmothequeResponseEntity>>> listfilmotheque({
    UserRequestEntity? body,
  });

  Future<DataState<List<SearchMovieResponseEntity>>> listmovie({
    String? idfilmotheque,
  });

  Future<DataState<FilmothequeResponseEntity>> modifiefilmotheque({
    String? idfilmotheque,
    CreateFilmothequeRequestEntity? body
  });

  Future<DataState<FilmothequeResponseEntity>> deletemovie({
    String? idfilmotheque,
    DeleteFilmRequestEntity? body
  });

  Future<DataState<FilmothequeResponseEntity>> deleteuserinfilmotheque({
    String? idfilmotheque,
    UserRequestEntity? body
  });

  Future<DataState<void>> deletefilmotheque({
    String? idfilmotheque,
  });
}