import 'package:dio/dio.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/livretermine/domain/entities/livretermine_entity.dart';

abstract class LivreTermineState {
  final LivreTermineResponseEntity? createlivretermine;
  final List<ApiBookResponseEntity>? listlivretermine;
  final void deletelivretermine;
  final DioException? error;

  const LivreTermineState({
    this.error,
    this.createlivretermine,
    this.listlivretermine,
    this.deletelivretermine,
  });
}

class LivreTermineLoading extends LivreTermineState {
  const LivreTermineLoading();
}

class CreateLivreTermineLoaded extends LivreTermineState {
  const CreateLivreTermineLoaded({LivreTermineResponseEntity? createlivretermine}) : super(createlivretermine: createlivretermine);
}

class DeleteLivreTermineLoaded extends LivreTermineState {
  const DeleteLivreTermineLoaded() : super();
}

class ListLivreTermineLoaded extends LivreTermineState {
  const ListLivreTermineLoaded(
      {List<ApiBookResponseEntity>? listlivretermine})
      : super(listlivretermine: listlivretermine);
}

class LivreTermineError extends LivreTermineState {
  const LivreTermineError(DioException? error) : super(error: error);
}

class DeleteLivreTermineError extends LivreTermineState {
  const DeleteLivreTermineError(DioException? error) : super(error: error);
}

class CreateLivreTermineError extends LivreTermineState {
  const CreateLivreTermineError(DioException? error) : super(error: error);
}

class ListLivreTermineError extends LivreTermineState {
  const ListLivreTermineError(DioException? error) : super(error: error);
}