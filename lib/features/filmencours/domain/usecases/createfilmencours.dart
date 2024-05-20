import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmencours/domain/entities/filmencours_entity.dart';
import 'package:whashlist/features/filmencours/domain/repositories/filmencours_repository.dart';

class CreateFilmEnCoursUseCase
    implements
        UseCase<DataState<FilmEnCoursResponseEntity>,
            CreateFilmEnCoursRequestEntity> {
  final FilmEnCoursRepository repository;
  const CreateFilmEnCoursUseCase(this.repository);

  @override
  Future<DataState<FilmEnCoursResponseEntity>> call(
      {CreateFilmEnCoursRequestEntity? params}) {
    return repository.createfilmencours(
      body: params,
    );
  }
}
