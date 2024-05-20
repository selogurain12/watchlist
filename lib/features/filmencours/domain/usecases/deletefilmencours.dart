import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmencours/domain/repositories/filmencours_repository.dart';

class DeleteFilmEnCoursUseCase implements UseCase<DataState<void>, String?> {
  final FilmEnCoursRepository repository;
  const DeleteFilmEnCoursUseCase(this.repository);
  
  @override
  Future<DataState<void>>call({String? params}) {
    return repository.deletefilmencours(
      id: params,
    );
  }
}