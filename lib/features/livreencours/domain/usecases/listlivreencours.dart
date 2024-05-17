import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/livreencours/domain/entities/livreencours_entity.dart';
import 'package:whashlist/features/livreencours/domain/repositories/livreencours_repository.dart';

class ListLivreEnCoursUseCase implements UseCase<DataState<List<AllLivreEnCoursResponseEntity>>, String?> {
  final LivreEnCoursRepository repository;
  const ListLivreEnCoursUseCase(this.repository);
  
  @override
  Future<DataState<List<AllLivreEnCoursResponseEntity>>>call({String? params}) {
    return repository.listlivreencours(
      id: params,
    );
  }
}