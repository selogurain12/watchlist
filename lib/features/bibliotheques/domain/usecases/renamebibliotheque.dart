import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';

class RenameBibliothequeUseCase implements UseCase<DataState<BibliothequesResponseEntity>, BibliothequeRequestEntity> {
  final BibliothequesRepository repository;
  const RenameBibliothequeUseCase(this.repository);
  
  @override
  Future<DataState<BibliothequesResponseEntity>>call({BibliothequeRequestEntity? params}) {
    return repository.renamebibliotheque(
      body: params,
    );
  }
}