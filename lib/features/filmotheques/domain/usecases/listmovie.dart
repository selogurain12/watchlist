import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';

class ListFilmUseCase
    implements UseCase<DataState<List<SearchMovieResponseEntity>>, String?> {
  final FilmothequesRepository repository;
  const ListFilmUseCase(this.repository);

  @override
  Future<DataState<List<SearchMovieResponseEntity>>> call({String? params}) {
    return repository.listmovie(idfilmotheque: params);
  }
}

