import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/bibliotheques/domain/entities/bibliotheques_entity.dart';
import 'package:whashlist/features/bibliotheques/domain/repositories/bibliotheques_repository.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

class DeleteUserinBibliothequeUseCase implements UseCase<DataState<BibliothequeResponseEntity>, DeleteUserInBibliothequeParams> {
  final BibliothequesRepository repository;
  const DeleteUserinBibliothequeUseCase(this.repository);
  
  @override
  Future<DataState<BibliothequeResponseEntity>> call({DeleteUserInBibliothequeParams? params}) {
    return repository.deleteuserinbibliotheque(
      idbibliotheque: params?.idbibliotheque,
      body: params?.body,
    );
  }
}

class DeleteUserInBibliothequeParams {
  final String? idbibliotheque;
  final UserRequestEntity? body;

  DeleteUserInBibliothequeParams({this.idbibliotheque, this.body});
}
