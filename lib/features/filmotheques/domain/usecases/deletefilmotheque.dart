import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';

class DeleteFilmothequeUseCase implements UseCase<DataState<void>, ListFilmFilmothequeRequestEntity> {
  final FilmothequesRepository repository;
  const DeleteFilmothequeUseCase(this.repository);
  
  @override
  Future<DataState<void>>call({ListFilmFilmothequeRequestEntity? params}) {
    return repository.deletefilmotheque(
      body: params,
    );
  }
}