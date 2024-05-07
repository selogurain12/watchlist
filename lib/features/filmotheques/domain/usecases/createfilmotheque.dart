import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';

class CreateFilmothequeUseCase implements UseCase<DataState<FilmothequeResponseEntity>, CreateFilmothequeRequestEntity> {
  final FilmothequesRepository repository;
  const CreateFilmothequeUseCase(this.repository);
  
  @override
  Future<DataState<FilmothequeResponseEntity>>call({CreateFilmothequeRequestEntity? params}) {
    return repository.createfilmotheque(
      body: params,
    );
  }
}