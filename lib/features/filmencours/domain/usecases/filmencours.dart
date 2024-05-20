import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmencours/domain/entities/filmencours_entity.dart';
import 'package:whashlist/features/filmencours/domain/repositories/filmencours_repository.dart';

class FilmEnCoursUseCase implements UseCase<DataState<FilmEnCoursResponseEntity>, String?> {
  final FilmEnCoursRepository repository;
  const FilmEnCoursUseCase(this.repository);
  
  @override
  Future<DataState<FilmEnCoursResponseEntity>>call({String? params}) {
    return repository.filmencours(
      id: params,
    );
  }
}