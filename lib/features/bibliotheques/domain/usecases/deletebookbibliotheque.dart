import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';

class DeleteBookBibliothequeUseCase implements UseCase<DataState<void>, LivreBibliothequeRequestEntity> {
  final BibliothequesRepository repository;
  const DeleteBookBibliothequeUseCase(this.repository);
  
  @override
  Future<DataState<void>>call({LivreBibliothequeRequestEntity? params}) {
    return repository.deletebookbibliotheque(
      body: params,
    );
  }
}