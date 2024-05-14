import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/livreencours/domain/entities/livreencours_entity.dart';
import 'package:whashlist/features/livreencours/domain/repositories/livreencours_repository.dart';

class UpdateLivreEnCoursUseCase implements UseCase<DataState<LivreEnCoursResponseEntity>, UpdateLivreEnCoursParams> {
  final LivreEnCoursRepository repository;
  const UpdateLivreEnCoursUseCase(this.repository);
  
  @override
  Future<DataState<LivreEnCoursResponseEntity>> call({UpdateLivreEnCoursParams? params}) {
    return repository.updatelivreencours(
      id: params?.id,
      body: params?.body,
    );
  }
}

class UpdateLivreEnCoursParams {
  final String? id;
  final UpdateLivreEnCoursRequestEntity? body;

  UpdateLivreEnCoursParams({this.id, this.body});
}
