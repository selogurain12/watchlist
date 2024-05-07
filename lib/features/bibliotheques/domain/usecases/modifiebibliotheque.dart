import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';

class ModifieBibliothequeUseCase implements UseCase<DataState<BibliothequeResponseEntity>, ModifieBibliothequeParams> {
  final BibliothequesRepository repository;
  const ModifieBibliothequeUseCase(this.repository);
  
  @override
  Future<DataState<BibliothequeResponseEntity>> call({ModifieBibliothequeParams? params}) {
    return repository.modifiebibliotheque(
      idbibliotheque: params?.idbibliotheque,
      body: params?.body,
    );
  }
}

class ModifieBibliothequeParams {
  final String? idbibliotheque;
  final CreateBibliothequeRequestEntity? body;

  ModifieBibliothequeParams({this.idbibliotheque, this.body});
}
