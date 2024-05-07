import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/filmotheques/domain/repositories/filmotheques_repository.dart';

class DeleteFilmothequeUseCase implements UseCase<DataState<void>, String?> {
  final FilmothequesRepository repository;
  const DeleteFilmothequeUseCase(this.repository);
  
  @override
  Future<DataState<void>>call({String? params}) {
    return repository.deletefilmotheque(
      idfilmotheque: params,
    );
  }
}