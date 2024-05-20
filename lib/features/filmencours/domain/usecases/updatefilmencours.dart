import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmencours/domain/entities/filmencours_entity.dart';
import 'package:whashlist/features/filmencours/domain/repositories/filmencours_repository.dart';

class UpdateFilmEnCoursUseCase implements UseCase<DataState<FilmEnCoursResponseEntity>, UpdateFilmEnCoursParams> {
  final FilmEnCoursRepository repository;
  const UpdateFilmEnCoursUseCase(this.repository);
  
  @override
  Future<DataState<FilmEnCoursResponseEntity>> call({UpdateFilmEnCoursParams? params}) {
    return repository.updatefilmencours(
      id: params?.id,
      body: params?.body,
    );
  }
}

class UpdateFilmEnCoursParams {
  final String? id;
  final UpdateFilmEnCoursRequestEntity? body;

  UpdateFilmEnCoursParams({this.id, this.body});
}
