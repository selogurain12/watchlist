import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmencours/domain/entities/filmencours_entity.dart';

abstract class FilmEnCoursRepository {
  Future<DataState<FilmEnCoursResponseEntity>> createfilmencours({
    CreateFilmEnCoursRequestEntity? body,
  });

  Future<DataState<List<AllFilmEnCoursResponseEntity>>> listfilmencours({
    String? id,
  });

  Future<DataState<FilmEnCoursResponseEntity>> filmencours({
    String? id,
  });

  Future<DataState<FilmEnCoursResponseEntity>> updatefilmencours({
    String? id,
    UpdateFilmEnCoursRequestEntity? body,
  });

  Future<DataState<void>> deletefilmencours({
    String? id,
  });
}