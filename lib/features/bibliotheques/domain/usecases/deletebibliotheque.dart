import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';

class DeleteBibliothequeUseCase implements UseCase<DataState<void>, String?> {
  final BibliothequesRepository repository;
  const DeleteBibliothequeUseCase(this.repository);
  
  @override
  Future<DataState<void>>call({String? params}) {
    return repository.deletebibliotheque(
      idbibliotheque: params,
    );
  }
}