import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';
import 'package:whashlist/features/friendlist/domain/repositories/friendlist_repository.dart';

class ListFriendUseCase implements UseCase<DataState<List<FriendlistResponseEntity>>, UserPrincipalRequestEntity> {
  final FriendlistRepository repository;
  const ListFriendUseCase(this.repository);
  
  @override
  Future<DataState<List<FriendlistResponseEntity>>> call({UserPrincipalRequestEntity? params}) {
    return repository.listfriend(
      body: params,
    );
  }
}