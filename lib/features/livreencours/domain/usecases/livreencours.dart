import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/livreencours/domain/entities/livreencours_entity.dart';
import 'package:whashlist/features/livreencours/domain/repositories/livreencours_repository.dart';

class LivreEnCoursUseCase implements UseCase<DataState<LivreEnCoursResponseEntity>, String?> {
  final LivreEnCoursRepository repository;
  const LivreEnCoursUseCase(this.repository);
  
  @override
  Future<DataState<LivreEnCoursResponseEntity>>call({String? params}) {
    return repository.livreencours(
      id: params,
    );
  }
}