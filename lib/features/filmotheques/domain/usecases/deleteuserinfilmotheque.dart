import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

class DeleteUserinFilmothequeUseCase implements UseCase<DataState<FilmothequeResponseEntity>, DeleteUserInFilmothequeParams> {
  final FilmothequesRepository repository;
  const DeleteUserinFilmothequeUseCase(this.repository);
  
  @override
  Future<DataState<FilmothequeResponseEntity>> call({DeleteUserInFilmothequeParams? params}) {
    return repository.deleteuserinfilmotheque(
      idfilmotheque: params?.idfilmotheque,
      body: params?.body,
    );
  }
}

class DeleteUserInFilmothequeParams {
  final String? idfilmotheque;
  final UserRequestEntity? body;

  DeleteUserInFilmothequeParams({this.idfilmotheque, this.body});
}
