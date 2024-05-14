import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/livretermine/domain/repositories/livretermine_repository.dart';

class DeleteLivreTermineUseCase implements UseCase<DataState<void>, String?> {
  final LivreTermineRepository repository;
  const DeleteLivreTermineUseCase(this.repository);
  
  @override
  Future<DataState<void>>call({String? params}) {
    return repository.deletelivretermine(
      id: params,
    );
  }
}