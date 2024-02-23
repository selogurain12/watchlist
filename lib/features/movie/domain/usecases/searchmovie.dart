import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/movie/domain/entities/movie_entity.dart';
import 'package:whashlist/features/movie/domain/repositories/movie_repository.dart';

class SearchMovieUseCase implements UseCase<DataState<List<ApiMovieResponseEntity>>, ApiMovieRequestEntity> {
  final ApiMovieRepository repository;
  const SearchMovieUseCase(this.repository);
  
  @override
  Future<DataState<List<ApiMovieResponseEntity>>> call({ApiMovieRequestEntity? params}) {
    return repository.searchmovie(
      body: params,
    );
  }
}