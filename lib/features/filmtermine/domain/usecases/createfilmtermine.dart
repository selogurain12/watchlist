import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmtermine/domain/entities/filmtermine_entity.dart';
import 'package:whashlist/features/filmtermine/domain/repositories/filmtermine_repository.dart';

class CreateFilmtermineUseCase
    implements
        UseCase<DataState<FilmTermineResponseEntity>,
            CreateFilmTermineRequestEntity> {
  final FilmTermineRepository repository;
  const CreateFilmtermineUseCase(this.repository);

  @override
  Future<DataState<FilmTermineResponseEntity>> call(
      {CreateFilmTermineRequestEntity? params}) {
    return repository.createfilmtermine(
      body: params,
    );
  }
}
