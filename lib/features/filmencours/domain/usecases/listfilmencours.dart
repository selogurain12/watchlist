import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmencours/domain/entities/filmencours_entity.dart';
import 'package:whashlist/features/filmencours/domain/repositories/filmencours_repository.dart';

class ListFilmEnCoursUseCase implements UseCase<DataState<List<AllFilmEnCoursResponseEntity>>, String?> {
  final FilmEnCoursRepository repository;
  const ListFilmEnCoursUseCase(this.repository);
  
  @override
  Future<DataState<List<AllFilmEnCoursResponseEntity>>>call({String? params}) {
    return repository.listfilmencours(
      id: params,
    );
  }
}