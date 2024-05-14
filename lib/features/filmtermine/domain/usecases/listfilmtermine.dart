import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmtermine/domain/repositories/filmtermine_repository.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';

class ListFilmTermineUseCase
    implements
        UseCase<DataState<List<SearchMovieResponseEntity>>, String> {
  final FilmTermineRepository repository;
  const ListFilmTermineUseCase(this.repository);

  @override
  Future<DataState<List<SearchMovieResponseEntity>>> call(
      {String? params}) {
    return repository.listfilmtermine(
      id: params,
    );
  }
}
