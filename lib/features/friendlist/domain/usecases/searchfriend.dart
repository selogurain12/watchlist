import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';
import 'package:whashlist/features/friendlist/domain/repositories/friendlist_repository.dart';

class SearchFriendUseCase implements UseCase<DataState<FriendlistResponseEntity>, UserFriendRequestEntity> {
  final FriendlistRepository repository;
  const SearchFriendUseCase(this.repository);
  
  @override
  Future<DataState<FriendlistResponseEntity>> call({UserFriendRequestEntity? params}) {
    return repository.searchfriend(
      body: params,
    );
  }
}