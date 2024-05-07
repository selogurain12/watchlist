import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

class ListBibliothequeUseCase implements UseCase<DataState<List<BibliothequeResponseEntity>>, UserRequestEntity> {
  final BibliothequesRepository repository;
  const ListBibliothequeUseCase(this.repository);
  
  @override
  Future<DataState<List<BibliothequeResponseEntity>>> call({UserRequestEntity? params}) {
    return repository.listbibliotheque(
      body: params,
    );
  }
}