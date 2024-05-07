import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/friendlist/domain/repositories/friendlist_repository.dart';

class DeleteFriendUseCase implements UseCase<DataState<void>, String?> {
  final FriendlistRepository repository;
  const DeleteFriendUseCase(this.repository);
  
  @override
  Future<DataState<void>>call({String? params}) {
    return repository.deletefriend(
      idfriend: params,
    );
  }
}