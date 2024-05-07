import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

class ListFilmothequeUseCase implements UseCase<DataState<List<FilmothequeResponseEntity>>, UserRequestEntity> {
  final FilmothequesRepository repository;
  const ListFilmothequeUseCase(this.repository);
  
  @override
  Future<DataState<List<FilmothequeResponseEntity>>> call({UserRequestEntity? params}) {
    return repository.listfilmotheque(
      body: params,
    );
  }
}