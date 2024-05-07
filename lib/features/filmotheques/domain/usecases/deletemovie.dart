import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/entities/filmotheques_entity.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';

class DeleteFilmUseCase implements UseCase<DataState<FilmothequeResponseEntity>, DeleteMovieParams> {
  final FilmothequesRepository repository;
  const DeleteFilmUseCase(this.repository);
  
  @override
  Future<DataState<FilmothequeResponseEntity>>call({DeleteMovieParams? params}) {
    return repository.deletemovie(
      idfilmotheque: params?.idfilmotheque,
      body: params?.body,
    );
  }
}

class DeleteMovieParams {
  final String? idfilmotheque;
  final DeleteFilmRequestEntity? body;

  DeleteMovieParams({this.idfilmotheque, this.body});
}
