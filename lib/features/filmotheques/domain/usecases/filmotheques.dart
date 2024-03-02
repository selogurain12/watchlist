import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';

class FilmothequesUseCase implements UseCase<DataState<List<FilmothequesResponseEntity>>, FilmothequesRequestEntity> {
  final FilmothequesRepository repository;
  const FilmothequesUseCase(this.repository);
  
  @override
  Future<DataState<List<FilmothequesResponseEntity>>> call({FilmothequesRequestEntity? params}) {
    return repository.filmotheques(
      body: params,
    );
  }
}