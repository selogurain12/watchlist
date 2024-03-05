import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';

class BibliothequesUseCase implements UseCase<DataState<List<BibliothequesResponseEntity>>, BibliothequesRequestEntity> {
  final BibliothequesRepository repository;
  const BibliothequesUseCase(this.repository);
  
  @override
  Future<DataState<List<BibliothequesResponseEntity>>> call({BibliothequesRequestEntity? params}) {
    return repository.bibliotheques(
      body: params,
    );
  }
}