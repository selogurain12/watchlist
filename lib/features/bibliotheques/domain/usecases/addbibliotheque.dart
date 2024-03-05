import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';

class AddBibliothequeUseCase implements UseCase<DataState<BibliothequesResponseEntity>, AddBibliothequeRequestEntity> {
  final BibliothequesRepository repository;
  const AddBibliothequeUseCase(this.repository);
  
  @override
  Future<DataState<BibliothequesResponseEntity>>call({AddBibliothequeRequestEntity? params}) {
    return repository.addbibliotheque(
      body: params,
    );
  }
}