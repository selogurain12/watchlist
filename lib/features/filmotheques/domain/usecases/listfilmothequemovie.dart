import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';

class ListFilmFilmothequeUseCase
    implements
        UseCase<DataState<List<SearchMovieResponseEntity>>,
            ListFilmFilmothequeRequestEntity> {
  final FilmothequesRepository repository;
  const ListFilmFilmothequeUseCase(this.repository);

  @override
  Future<DataState<List<SearchMovieResponseEntity>>> call(
      {ListFilmFilmothequeRequestEntity? params}) {
    return repository.filmothequemovie(
      body: params,
    );
  }
}
