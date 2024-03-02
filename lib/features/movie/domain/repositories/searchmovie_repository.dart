import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';

abstract class SearchMovieRepository {
  Future<DataState<List<SearchMovieResponseEntity>>> searchmovie({
    SearchMovieRequestEntity? body,
  });
}