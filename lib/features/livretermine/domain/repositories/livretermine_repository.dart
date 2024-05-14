import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/livretermine/domain/entities/livretermine_entity.dart';

abstract class LivreTermineRepository {
  Future<DataState<LivreTermineResponseEntity>> createlivretermine({
    CreateLivreTermineRequestEntity? body,
  });

  Future<DataState<List<ApiBookResponseEntity>>> listlivretermine({
    String? id,
  });

  Future<DataState<void>> deletelivretermine({
    String? id,
  });
}