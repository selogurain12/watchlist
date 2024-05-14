import 'package:dio/dio.dart';
import 'package:whashlist/features/book/domain/entities/book_entity.dart';
import 'package:whashlist/features/livreencours/domain/entities/livreencours_entity.dart';

abstract class LivreEnCoursState {
  final LivreEnCoursResponseEntity? createlivreencours;
  final List<ApiBookResponseEntity>? listlivreencours;
  final LivreEnCoursResponseEntity? updatelivreencours;
  final void deletelivreencours;
  final DioException? error;

  const LivreEnCoursState({
    this.error,
    this.createlivreencours,
    this.listlivreencours,
    this.updatelivreencours,
    this.deletelivreencours,
  });
}

class LivreEnCoursLoading extends LivreEnCoursState {
  const LivreEnCoursLoading();
}

class CreateLivreEnCoursLoaded extends LivreEnCoursState {
  const CreateLivreEnCoursLoaded(
      {LivreEnCoursResponseEntity? createlivreencours})
      : super(createlivreencours: createlivreencours);
}

class DeleteLivreEnCoursLoaded extends LivreEnCoursState {
  const DeleteLivreEnCoursLoaded() : super();
}

class ListLivreEnCoursLoaded extends LivreEnCoursState {
  const ListLivreEnCoursLoaded({List<ApiBookResponseEntity>? listlivreencours})
      : super(listlivreencours: listlivreencours);
}

class UpdateLivreEnCoursLoaded extends LivreEnCoursState {
  const UpdateLivreEnCoursLoaded({LivreEnCoursResponseEntity? updatelivreencours})
      : super(updatelivreencours: updatelivreencours);
}

class LivreEnCoursError extends LivreEnCoursState {
  const LivreEnCoursError(DioException? error) : super(error: error);
}

class DeleteLivreEnCoursError extends LivreEnCoursState {
  const DeleteLivreEnCoursError(DioException? error) : super(error: error);
}

class CreateLivreEnCoursError extends LivreEnCoursState {
  const CreateLivreEnCoursError(DioException? error) : super(error: error);
}

class ListLivreEnCoursError extends LivreEnCoursState {
  const ListLivreEnCoursError(DioException? error) : super(error: error);
}

class UpdateLivreEnCoursError extends LivreEnCoursState {
  const UpdateLivreEnCoursError(DioException? error) : super(error: error);
}
