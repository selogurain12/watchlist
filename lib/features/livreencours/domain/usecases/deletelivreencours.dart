import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/livreencours/domain/repositories/livreencours_repository.dart';

class DeleteLivreEnCoursUseCase implements UseCase<DataState<void>, String?> {
  final LivreEnCoursRepository repository;
  const DeleteLivreEnCoursUseCase(this.repository);
  
  @override
  Future<DataState<void>>call({String? params}) {
    return repository.deletelivreencours(
      id: params,
    );
  }
}