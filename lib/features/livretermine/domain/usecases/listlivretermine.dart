import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/livretermine/domain/repositories/livretermine_repository.dart';

class ListLivreTermineUseCase implements UseCase<DataState<List<ApiBookResponseEntity>>, String?> {
  final LivreTermineRepository repository;
  const ListLivreTermineUseCase(this.repository);
  
  @override
  Future<DataState<List<ApiBookResponseEntity>>>call({String? params}) {
    return repository.listlivretermine(
      id: params,
    );
  }
}