import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/movie/domain/entities/movie_entity.dart';

abstract class ApiMovieRepository {
  Future<DataState<List<ApiMovieResponseEntity>>> searchmovie({
    ApiMovieRequestEntity? body,
  });
}