import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';

class DeleteBookUseCase implements UseCase<DataState<BibliothequeResponseEntity>, DeleteBookParams> {
  final BibliothequesRepository repository;
  const DeleteBookUseCase(this.repository);
  
  @override
  Future<DataState<BibliothequeResponseEntity>>call({DeleteBookParams? params}) {
    return repository.deletebook(
      idbibliotheque: params?.idbibliotheque,
      body: params?.body,
    );
  }
}

class DeleteBookParams {
  final String? idbibliotheque;
  final DeleteLivreRequestEntity? body;

  DeleteBookParams({this.idbibliotheque, this.body});
}
