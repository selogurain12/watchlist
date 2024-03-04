import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';

class AddFilmothequeUseCase implements UseCase<DataState<FilmothequesResponseEntity>, AddFilmothequeRequestEntity> {
  final FilmothequesRepository repository;
  const AddFilmothequeUseCase(this.repository);
  
  @override
  Future<DataState<FilmothequesResponseEntity>>call({AddFilmothequeRequestEntity? params}) {
    return repository.addfilmotheque(
      body: params,
    );
  }
}