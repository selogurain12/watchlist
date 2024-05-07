import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/core/usecases/usecase.dart';
import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';
import 'package:whashlist/features/friendlist/domain/repositories/friendlist_repository.dart';
import 'package:whashlist/features/user/domain/entities/user_entity.dart';

class ListFriendUseCase
    implements
        UseCase<DataState<List<FriendlistResponseEntity>>, UserRequestEntity> {
  final FriendlistRepository repository;
  const ListFriendUseCase(this.repository);

  @override
  Future<DataState<List<FriendlistResponseEntity>>> call(
      {UserRequestEntity? params}) {
    return repository.listfriend(
      body: params,
    );
  }
}
