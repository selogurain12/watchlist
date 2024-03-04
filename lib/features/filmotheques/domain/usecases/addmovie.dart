import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';

class FilmFilmothequeUseCase implements UseCase<DataState<FilmFilmothequeResponseEntity>, FilmFilmothequeRequestEntity> {
  final FilmothequesRepository repository;
  const FilmFilmothequeUseCase(this.repository);
  
  @override
  Future<DataState<FilmFilmothequeResponseEntity>>call({FilmFilmothequeRequestEntity? params}) {
    return repository.addmovie(
      body: params,
    );
  }
}