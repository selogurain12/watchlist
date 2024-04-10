import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';

class DeleteMovieFilmothequeUseCase implements UseCase<DataState<void>, FilmFilmothequeRequestEntity> {
  final FilmothequesRepository repository;
  const DeleteMovieFilmothequeUseCase(this.repository);
  
  @override
  Future<DataState<void>>call({FilmFilmothequeRequestEntity? params}) {
    return repository.deletemoviefilmotheque(
      body: params,
    );
  }
}