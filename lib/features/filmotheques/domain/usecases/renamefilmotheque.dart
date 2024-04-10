import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';

class RenameFilmothequeUseCase implements UseCase<DataState<FilmothequesResponseEntity>, FilmothequeRequestEntity> {
  final FilmothequesRepository repository;
  const RenameFilmothequeUseCase(this.repository);
  
  @override
  Future<DataState<FilmothequesResponseEntity>>call({FilmothequeRequestEntity? params}) {
    return repository.renamefilmotheque(
      body: params,
    );
  }
}