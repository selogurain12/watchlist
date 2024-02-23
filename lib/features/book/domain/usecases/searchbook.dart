import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/book/domain/repositories/book_repository.dart';

class SearchBookUseCase implements UseCase<DataState<List<ApiBookResponseEntity>>, ApiBookRequestEntity> {
  final ApiBookRepository repository;
  const SearchBookUseCase(this.repository);
  
  @override
  Future<DataState<List<ApiBookResponseEntity>>> call({ApiBookRequestEntity? params}) {
    return repository.searchbook(
      body: params,
    );
  }
}