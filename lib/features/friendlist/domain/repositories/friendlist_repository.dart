import 'package:whashlist/core/ressources/data_state.dart';
import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';

abstract class FriendlistRepository {
  Future<DataState<FriendlistResponseEntity>> addfriend({
    FriendlistRequestEntity? body,
  });

  Future<DataState<List<FriendlistResponseEntity>>> listfriend({
    UserPrincipalRequestEntity? body,
  });

  Future<DataState<FriendlistResponseEntity>> searchfriend({
    UserFriendRequestEntity? body,
  });
}