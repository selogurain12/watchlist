import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';

abstract class FilmothequesRepository {
  Future<DataState<List<FilmothequesResponseEntity>>> filmotheques({
    FilmothequesRequestEntity? body,
  });

  Future<DataState<FilmothequesResponseEntity>> addfilmotheque({
    AddFilmothequeRequestEntity? body,
  });

  Future<DataState<FilmFilmothequeResponseEntity>> addmovie({
    FilmFilmothequeRequestEntity? body,
  });
}