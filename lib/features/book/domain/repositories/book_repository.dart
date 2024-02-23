import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';

abstract class ApiBookRepository {
  Future<DataState<List<ApiBookResponseEntity>>> searchbook({
    ApiBookRequestEntity? body,
  });
}