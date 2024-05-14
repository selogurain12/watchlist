import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/filmtermine/domain/entities/filmtermine_entity.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';

abstract class FilmTermineRepository {
  Future<DataState<FilmTermineResponseEntity>> createfilmtermine({
    CreateFilmTermineRequestEntity? body,
  });

  Future<DataState<List<SearchMovieResponseEntity>>> listfilmtermine({
    String? id,
  });

  Future<DataState<void>> deletefilmtermine({
    String? id,
  });
}