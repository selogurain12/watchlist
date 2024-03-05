import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';

class LivreBibliothequeUseCase implements UseCase<DataState<LivreBibliothequeResponseEntity>, LivreBibliothequeRequestEntity> {
  final BibliothequesRepository repository;
  const LivreBibliothequeUseCase(this.repository);
  
  @override
  Future<DataState<LivreBibliothequeResponseEntity>>call({LivreBibliothequeRequestEntity? params}) {
    return repository.addbook(
      body: params,
    );
  }
}