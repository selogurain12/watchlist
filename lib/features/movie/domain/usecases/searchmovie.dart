import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/movie/domain/entities/searchmovie_entity.dart';
import 'package:whashlist/features/movie/domain/repositories/searchmovie_repository.dart';

class SearchMovieUseCase implements UseCase<DataState<List<SearchMovieResponseEntity>>, SearchMovieRequestEntity> {
  final SearchMovieRepository repository;
  const SearchMovieUseCase(this.repository);
  
  @override
  Future<DataState<List<SearchMovieResponseEntity>>> call({SearchMovieRequestEntity? params}) {
    return repository.searchmovie(
      body: params,
    );
  }
}