import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';

class CreateBibliothequeUseCase implements UseCase<DataState<BibliothequeResponseEntity>, CreateBibliothequeRequestEntity> {
  final BibliothequesRepository repository;
  const CreateBibliothequeUseCase(this.repository);
  
  @override
  Future<DataState<BibliothequeResponseEntity>>call({CreateBibliothequeRequestEntity? params}) {
    return repository.createbibliotheque(
      body: params,
    );
  }
}