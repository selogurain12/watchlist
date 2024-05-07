import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';

class ModifieFilmothequeUseCase implements UseCase<DataState<FilmothequeResponseEntity>, ModifieFilmothequeParams> {
  final FilmothequesRepository repository;
  const ModifieFilmothequeUseCase(this.repository);
  
  @override
  Future<DataState<FilmothequeResponseEntity>> call({ModifieFilmothequeParams? params}) {
    return repository.modifiefilmotheque(
      idfilmotheque: params?.idfilmotheque,
      body: params?.body,
    );
  }
}

class ModifieFilmothequeParams {
  final String? idfilmotheque;
  final CreateFilmothequeRequestEntity? body;

  ModifieFilmothequeParams({this.idfilmotheque, this.body});
}
