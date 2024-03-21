import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';
import 'package:whashlist/features/friendlist/domain/repositories/friendlist_repository.dart';

class AddFriendUseCase implements UseCase<DataState<FriendlistResponseEntity>, FriendlistRequestEntity> {
  final FriendlistRepository repository;
  const AddFriendUseCase(this.repository);
  
  @override
  Future<DataState<FriendlistResponseEntity>>call({FriendlistRequestEntity? params}) {
    return repository.addfriend(
      body: params,
    );
  }
}