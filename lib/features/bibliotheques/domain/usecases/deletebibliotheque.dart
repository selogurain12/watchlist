import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';

class DeleteBibliothequeUseCase implements UseCase<DataState<void>, ListLivreBibliothequeRequestEntity> {
  final BibliothequesRepository repository;
  const DeleteBibliothequeUseCase(this.repository);
  
  @override
  Future<DataState<void>>call({ListLivreBibliothequeRequestEntity? params}) {
    return repository.deletebibliotheque(
      body: params,
    );
  }
}