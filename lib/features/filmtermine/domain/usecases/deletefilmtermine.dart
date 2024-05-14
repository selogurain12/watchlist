import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmtermine/domain/repositories/filmtermine_repository.dart';

class DeleteFilmTermineUseCase implements UseCase<DataState<void>, String?> {
  final FilmTermineRepository repository;
  const DeleteFilmTermineUseCase(this.repository);
  
  @override
  Future<DataState<void>>call({String? params}) {
    return repository.deletefilmtermine(
      id: params,
    );
  }
}