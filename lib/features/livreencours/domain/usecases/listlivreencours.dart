import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/livreencours/domain/repositories/livreencours_repository.dart';

class ListLivreEnCoursUseCase implements UseCase<DataState<List<ApiBookResponseEntity>>, String?> {
  final LivreEnCoursRepository repository;
  const ListLivreEnCoursUseCase(this.repository);
  
  @override
  Future<DataState<List<ApiBookResponseEntity>>>call({String? params}) {
    return repository.listlivreencours(
      id: params,
    );
  }
}