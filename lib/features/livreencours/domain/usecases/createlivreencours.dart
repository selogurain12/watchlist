import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/livreencours/domain/entities/livreencours_entity.dart';
import 'package:whashlist/features/livreencours/domain/repositories/livreencours_repository.dart';

class CreateLivreEnCoursUseCase
    implements
        UseCase<DataState<LivreEnCoursResponseEntity>,
            CreateLivreEnCoursRequestEntity> {
  final LivreEnCoursRepository repository;
  const CreateLivreEnCoursUseCase(this.repository);

  @override
  Future<DataState<LivreEnCoursResponseEntity>> call(
      {CreateLivreEnCoursRequestEntity? params}) {
    return repository.createlivreencours(
      body: params,
    );
  }
}
