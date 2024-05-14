import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/livretermine/domain/entities/livretermine_entity.dart';
import 'package:whashlist/features/livretermine/domain/repositories/livretermine_repository.dart';

class CreateLivretermineUseCase
    implements
        UseCase<DataState<LivreTermineResponseEntity>,
            CreateLivreTermineRequestEntity> {
  final LivreTermineRepository repository;
  const CreateLivretermineUseCase(this.repository);

  @override
  Future<DataState<LivreTermineResponseEntity>> call(
      {CreateLivreTermineRequestEntity? params}) {
    return repository.createlivretermine(
      body: params,
    );
  }
}
